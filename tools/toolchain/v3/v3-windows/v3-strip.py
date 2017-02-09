#!/usr/bin/env python3

import os
import sys
from common import *

def main(argv):
    
    soFile = findParaArgu(argv, '-o')
    assert soFile is not None, '.so'

    writefile(soFile, *argv)

if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
