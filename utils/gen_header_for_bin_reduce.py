#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys

if sys.version_info[0] != 3 or sys.version_info[1] < 5:
    print('This script requires Python version 3.5')
    sys.exit(1)

import argparse
import json
import os
import subprocess

MIDOUT_TRACE_MAGIC = 'midout_trace v0\n'

class HeaderGen:
    _dtypes = None
    _oprs = None
    _fout = None
    _elemwise_modes = None
    _has_netinfo = False
    _midout_files = None

    def __init__(self):
        self._dtypes = set()
        self._oprs = set()
        self._elemwise_modes = set()
        self._midout_files = []

    def extend_netinfo(self, data):
        self._has_netinfo = True
        for i in data['dtypes']:
            self._dtypes.add(i)
        for i in data['opr_types']:
            self._oprs.add(i)
        for i in data['elemwise_modes']:
            self._elemwise_modes.add(i)

    def extend_midout(self, fname):
        self._midout_files.append(fname)

    def generate(self, fout):
        self._fout = fout
        if self._has_netinfo:
            self._write_dtype()
            self._write_elemwise_modes()
            self._write_oprs()
        self._write_midout()
        del self._fout

    def _write_oprs(self):
        defs = ['}',  'namespace opr {']
        for i in self._oprs:
            defs.append('class {};'.format(i))
        defs.append('}')
        defs.append('namespace serialization {')
        defs.append("""
            template<class Opr, class Callee>
            struct OprRegistryCaller {
            }; """)
        for i in sorted(self._oprs):
            defs.append("""
                template<class Callee>
                struct OprRegistryCaller<opr::{}, Callee>: public
                    OprRegistryCallerDefaultImpl<Callee> {{
                }}; """.format(i))
        self._write_def('MGB_OPR_REGISTRY_CALLER_SPECIALIZE', defs)

    def _write_elemwise_modes(self):
        mode_list_path = os.path.realpath(os.path.join(
            os.path.dirname(__file__),
            '../brain/megdnn-v3/scripts/generated/elemwise_modes.txt'))
        with open(mode_list_path) as fin:
            mode_list = [i.strip() for i in fin]

        for i in mode_list:
            if i in self._elemwise_modes:
                content = '_cb({})'.format(i)
            else:
                content = ''
            self._write_def(
                '_MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_{}(_cb)'.format(i), content)
        self._write_def('MEGDNN_ELEMWISE_MODE_ENABLE(_mode, _cb)',
                        '_MEGDNN_ELEMWISE_MODE_ENABLE_IMPL_##_mode(_cb)')

    def _write_dtype(self):
        if 'Float16' not in self._dtypes:
            # MegBrain/MegDNN used MEGDNN_DISABLE_FLOT16 to turn off float16
            # support in the past; however `FLOT16' is really a typo. We plan to
            # change MEGDNN_DISABLE_FLOT16 to MEGDNN_DISABLE_FLOAT16 soon.
            # To prevent issues in the transition, we decide to define both
            # macros (`FLOT16' and `FLOAT16') here.
            #
            # In the future when the situation is settled and no one would ever
            # use legacy MegBrain/MegDNN, the `FLOT16' macro definition can be
            # safely deleted.
            self._write_def('MEGDNN_DISABLE_FLOT16', 1)
            self._write_def('MEGDNN_DISABLE_FLOAT16', 1)

    def _write_def(self, name, val):
        if isinstance(val, list):
            val = '\n'.join(val)
        val = str(val).strip().replace('\n', ' \\\n')
        self._fout.write('#define {} {}\n'.format(name, val))

    def _write_midout(self):
        if not self._midout_files:
            return

        gen = os.path.join(os.path.dirname(__file__), os.pardir,
                           'brain', 'midout', 'gen_header.py')
        cvt = subprocess.run(
            [gen] + self._midout_files,
            stdout=subprocess.PIPE, check=True,
        ).stdout.decode('utf-8')
        self._fout.write('// midout \n')
        self._fout.write(cvt)

def main():
    parser = argparse.ArgumentParser(
        description='generate header file for reducing binary size by '
        'stripping unused oprs in a particular network; output file would '
        'be written to bin_reduce.h',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument(
        'inputs', nargs='+',
        help='input files that describe specific traits of the network; '
        'can be one of the following:'
        '  1. json files generated by '
        'megbrain.serialize_comp_graph_to_file() in python; '
        '  2. trace files generated by midout library')
    args = parser.parse_args()

    gen = HeaderGen()
    for i in args.inputs:
        print('==== processing {}'.format(i))
        with open(i) as fin:
            if fin.read(len(MIDOUT_TRACE_MAGIC)) == MIDOUT_TRACE_MAGIC:
                gen.extend_midout(i)
            else:
                fin.seek(0)
                gen.extend_netinfo(json.loads(fin.read()))

    with open(os.path.join(
            os.path.dirname(__file__), 'bin_reduce.h'), 'w') as fout:
        gen.generate(fout)

if __name__ == '__main__':
    main()
