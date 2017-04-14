#!/usr/bin/env python3

import os
import sys

def writefile(filename, *contents):
    with open(filename, 'w') as f:
        for l in contents:
            f.write(l)
            f.write('\n')

def readfile(filename):
    with open(filename, 'r') as f:
        return f.read()

def findsymbol(argv, *symbols):
    for arg in argv:
        if arg in symbols:
            return arg
    return None
def findParaArgu(argv, para):
    for i in range(len(argv) - 1):
        if (argv[i] == para):
            return argv[i + 1]
    return None


