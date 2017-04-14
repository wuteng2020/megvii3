#!/usr/bin/env python3

import os
import sys
from common import *

def main(argv):
    #print(argv)

    assert len(argv) == 1, 'len == 1'
    assert argv[0][0] == '@', '@'
    assert argv[0][-9:] == '-2.params', '-2.params'

    parFile = argv[0][-9:]
    outFile = argv[0][1:-9]

    writefile(parFile)
    writefile(outFile)

    assert outFile.endswith('.a'), '.a?'

if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
