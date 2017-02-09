#!/usr/bin/env python3

import os
import sys
from common import *

def main(argv):
    #print(argv)

    if findsymbol(argv, '-shared') is not None:
        linkDll(argv)
    elif findsymbol(argv, '-o') is not None:
        linkExe(argv)
    else:
        buildObj(argv)

def linkDll(argv):
    outputFile = findParaArgu(argv, "-o")

    assert outputFile is not None, "outputFile"
    writefile(outputFile)

def linkExe(argv):
    outputFile = findParaArgu(argv, "-o")

    assert outputFile is not None, "outputFile"
    writefile(outputFile)

def buildObj(argv):
    outputFile = None
    dotdFile = None
    srcFile = None
    srcType = None
    for i in range(len(argv)):
        if argv[i].startswith('/Fo'):
            outputFile = argv[i][3:]
        elif argv[i].startswith('/DEPENDENCY_FILE:'):
            dotdFile = argv[i].split(':')[1]
        elif argv[i].startswith('/C:'):
            [nocare, srcType, srcFile] = argv[i].split(':')

    assert outputFile is not None, "outputFile"
    assert outputFile.endswith('.o'), "outputFile .o"
    assert dotdFile is not None, "dotdFile"
    assert dotdFile.endswith('.d'), "dotdFile .d"
    assert srcFile is not None, "srcFile"
    assert srcType is not None, "srcType"
    assert srcType.startswith('#'), "srcType #"
    
    writefile(dotdFile, *argv)
    writefile(outputFile)



    if outputFile is not None:
        open(outputFile, 'a').close()
    if dotdFile is not None:
        open(dotdFile, 'a').close()

if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
