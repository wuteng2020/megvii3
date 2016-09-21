#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys

def format_size(val):
    units = iter(['b', 'kb', 'mb', 'gb'])
    u = next(units)
    while val >= 1024:
        u = next(units)
        val /= 1024

    if u != 'b':
        val = '{:.2f}'.format(val)
    return '{}{}'.format(val, u)


def main():
    if sys.stdin.isatty():
        print('{}: used after output of nm to add accumulated size add '
              'the beginning of each line'.format(sys.argv[0]))
        sys.exit(-1)

    tot_size = 0
    output = []
    for line in sys.stdin:
        line = line.strip()
        addr, size, data = line.split(' ', 2)
        if size == 'U':
            continue
        size = int(size, 16)
        tot_size += size
        output.append((format_size(size), format_size(tot_size), line))

    max_l0 = max(len(i[0]) for i in output)
    max_l1 = max(len(i[1]) for i in output)

    fmt = ('{:%d} {:%d} {}' % (max_l0, max_l1)).format
    for size, accum, line in output:
        print(fmt(size, accum, line))


if __name__ == '__main__':
    main()

