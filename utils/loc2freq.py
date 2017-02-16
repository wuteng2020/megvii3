#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import collections
import subprocess
import multiprocessing
import shlex
import time
import sys

import zmq
import numpy as np

class OnlineUniformSample:
    """keep *k* elements sampled uniformly from a input stream"""
    _nr_sample = None
    _nr_tot = 0
    _list = None

    def __init__(self, nr_sample, rng=None):
        self._list = []
        self._nr_sample = nr_sample
        if rng is None:
            rng = np.random.RandomState()
        self._rng = rng

    def append(self, item):
        self._nr_tot += 1
        if self._nr_tot <= self._nr_sample:
            self._list.append(item)
            return
        if self._rng.randint(self._nr_tot) == 0:
            idx = self._rng.randint(self._nr_sample)
            self._list[idx] = item

    def get(self):
        return self._list

    @property
    def tot(self):
        """total items alread added"""
        return self._nr_tot


class Loc2Freq:
    _fpath = None
    _args = None

    _jobs = None

    class WorkerProc:
        _owner = None
        _begin = None
        _end = None
        _subp = None
        _done = 0

        _zmq_port = None
        _zmq_recv = None

        def __init__(self, owner, rank, begin, end):
            self._owner = owner
            self._begin = rank * (end - begin) // owner._jobs + begin
            self._end = (rank + 1) * (end - begin) // owner._jobs + begin
            self._zmq_port = multiprocessing.Value('i', 0)
            self._subp = multiprocessing.Process(target=self._worker)
            self._subp.start()
            self._zmq_recv = self._make_zmq_pair(True)

        def _make_zmq_pair(self, is_srv):
            ctx = zmq.Context()
            socket = ctx.socket(zmq.PAIR)
            port = self._zmq_port
            if is_srv:
                with port:
                    port.value = socket.bind_to_random_port('tcp://*')
            else:
                while True:
                    with port:
                        pv = port.value
                        if pv:
                            break
                        time.sleep(0.1)
                socket.connect('tcp://localhost:{}'.format(pv))
            return socket

        @property
        def _tot(self):
            return self._end - self._begin

        def get(self):
            if self._done < self._tot:
                cnt, ret = self._zmq_recv.recv_pyobj()
                assert cnt == self._done, (
                    'bad message: {} {}'.format(cnt, self._done))
                self._done += 1
                if self.finished:
                    self._zmq_recv.send(b'done')
                    self._zmq_recv.close()
                return cnt + self._begin, ret

        @property
        def finished(self):
            return self._done == self._tot

        def join(self):
            return self._subp.join()

        def _parse_symbolizer_output(self, stdout):
            lines = []
            while True:
                cur = stdout.readline().decode('utf-8').strip()
                if not cur:
                    break
                lines.append(cur)

            incl_path = self._owner._args.incl_path
            if incl_path:
                found = False
                for start, val in enumerate(lines):
                    if incl_path in val:
                        found = True
                        break
                if not found:
                    return '<excluded>'
                if self._owner._args.stop_at_incl_path:
                    lines = lines[start:]

            stl_path = self._owner._args.stl_path
            if not stl_path:
                return lines[0]
            pos = lines[0].rfind(stl_path)
            if pos == -1:
                return lines[0]

            prefix = lines[0][:pos+len(stl_path)]
            comp = []
            for i in lines:
                if i.startswith(prefix):
                    comp.append(i[len(prefix):])
                else:
                    break

            return '{}{{{}}}'.format(prefix, ','.join(comp))

        def _worker(self):
            def make_subp():
                return subprocess.Popen(
                    [self._owner._args.symbolizer,
                     '-functions=none', '-obj={}'.format(self._owner._fpath)],
                    stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                    stderr=subprocess.DEVNULL)
            pwrite = self._make_zmq_pair(False)
            subp = make_subp()

            def get_loc(addr):
                nonlocal subp
                try:
                    subp.stdin.write((hex(addr) + '\n').encode('utf-8'))
                    subp.stdin.flush()
                    return self._parse_symbolizer_output(subp.stdout)
                except Exception as exc:
                    subp.poll()
                    assert subp.returncode
                    subp.wait()
                    print(
                        'worker ({},{}) failed with {};'
                        ' addr={} retcode={} pid={}; restarting'.
                        format(*map(hex, addr_range), exc, hex(i),
                               subp.returncode, subp.pid),
                        file=sys.stderr)
                    subp = make_subp()
                    msg = 'fail:{}'.format(hex(i))

            done = 0
            addr_range = (self._begin, self._end)

            for i in range(*addr_range):
                pwrite.send_pyobj((done, get_loc(i)))
                done += 1
            pwrite.recv()
            pwrite.close()
            subp.stdin.close()
            subp.wait()

    def __init__(self, args):
        self._args = args
        self._jobs = args.jobs

    @classmethod
    def _bar(cls, k, width):
        n = int(width * k)
        return '#' * n + ' ' * (width - n)

    def __call__(self, fpath):
        self._queue_ret = multiprocessing.Queue()
        self._fpath = fpath
        loc2freq = collections.defaultdict(lambda : OnlineUniformSample(30))

        addr_begin, addr_end = self._get_text_range()
        print('found text range: ({}, {})'.format(
            *map(hex, (addr_begin, addr_end))))
        prev_time = start_time = time.time()

        workers = [self.WorkerProc(self, i, addr_begin, addr_end)
                   for i in range(self._jobs)]

        finished = 0
        finished_size = 0
        tot = addr_end - addr_begin
        while finished < tot:
            for i in workers:
                if not i.finished:
                    addr, loc = i.get()
                    finished_size += len(loc)
                    loc2freq[loc].append(addr)
                    finished += 1
            t = time.time()
            if t - prev_time > 0.1:
                prev_time = t
                if not finished:
                    eta = 'N/A'
                else:
                    eta = int((t - start_time) * (tot / finished - 1))
                    eta = '{:02}:{:02}'.format(eta // 60, eta % 60)
                print(
                    '[{}] {:8}/{} {:5.2f}MiB/s [ETA {}]'.format(
                        self._bar(finished / tot, 60), finished, tot,
                        finished_size / (t - start_time) / 1024, eta),
                    end='\r', flush=True)

        for i in workers:
            i.join()

        return sorted(loc2freq.items(), key=lambda x: -x[1].tot)

    def _get_text_range(self):
        """get (begin, end) in bytes offset of text section in the file"""
        proc = subprocess.run([self._args.size, '-A', self._fpath],
                              stdout=subprocess.PIPE, check=True)
        stdout = proc.stdout.decode('utf-8')
        for line in stdout.splitlines():
            parts = line.split()
            if len(parts) != 3 or parts[0] != '.text':
                continue

            size, addr = map(int, parts[1:])
            return addr, addr + size
        raise RuntimeError('.text not found in {}: llvm-size output: {}'.
                           format(self._fpath, stdout))


def main():
    parser = argparse.ArgumentParser(
        description='get stats of frequency for each source '
        'location in an ELF file; useful for reducing binary size',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('--size', default='llvm-size',
                        help='llvm-size executable')
    parser.add_argument('--symbolizer', default='llvm-symbolizer',
                        help='name for the llvm-symbolizer')
    parser.add_argument('-j', '--jobs', type=int, default=1,
                        help='number of parallel jobs')
    parser.add_argument('-o', '--output', required=True,
                        help='output file to write result')
    parser.add_argument('--stl-path',
                        help='give a string for last path component of STL '
                        'headers, so inlined STL functions would all be '
                        'concatenated to output path (example: "4.9.x/" for '
                        'android NDK')
    parser.add_argument('--incl-path',
                        help='set a path so that an entry must contain it to '
                        'be included in the final stat')
    parser.add_argument('--stop-at-incl-path', action='store_true',
                        help='walk through inline stack and include the last '
                        'frame that contain --incl-path')
    parser.add_argument('input', help='ELF file to be analyzed')
    args = parser.parse_args()

    stats = Loc2Freq(args)(args.input)
    with open(args.output, 'w') as fout:
        for (loc, stat) in stats:
            fout.write('{} {} [{}]\n'.format(
                stat.tot, loc, ', '.join(map(hex, sorted(stat.get())))))

if __name__ == '__main__':
    main()
