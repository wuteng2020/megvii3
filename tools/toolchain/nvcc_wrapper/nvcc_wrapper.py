#!/usr/bin/env python
# Copyright 2015 The TensorFlow Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================

"""Crosstool wrapper for compiling CUDA programs.

SYNOPSIS:
  crosstool_wrapper_is_not_gcc [options passed in by cc_library()
                                or cc_binary() rule]

DESCRIPTION:
  This script is expected to be called by the cc_library() or cc_binary() bazel
  rules. When the option "-x cuda" is present in the list of arguments passed
  to this script, it invokes the nvcc CUDA compiler. Most arguments are passed
  as is as a string to --compiler-options of nvcc. When "-x cuda" is not
  present, this wrapper invokes hybrid_driver_is_not_gcc with the input
  arguments as is.

NOTES:
  Changes to the contents of this file must be propagated from
  //third_party/gpus/crosstool/crosstool_wrapper_is_not_gcc to
  //third_party/gpus/crosstool/v*/*/clang/bin/crosstool_wrapper_is_not_gcc
"""

from __future__ import print_function

from argparse import ArgumentParser
import os
import subprocess
import re
import sys
import pipes
import hashlib

CPU_COMPILER = ('gcc')
GCC_HOST_COMPILER_PATH = ('/usr/bin/gcc')
NVCC_PATH = '/usr/local/cuda/bin/nvcc'
SUPPORTED_CUDA_COMPUTE_CAPABILITIES = [ "2.0" ]

CURRENT_DIR = os.path.dirname(sys.argv[0])
PREFIX_DIR = os.path.dirname(GCC_HOST_COMPILER_PATH)

def Log(s):
  print('gpus/crosstool: {0}'.format(s))


def GetOptionValue(argv, option):
  """Extract the list of values for option from the argv list.

  Args:
    argv: A list of strings, possibly the argv passed to main().
    option: The option whose value to extract, without the leading '-'.

  Returns:
    A list of values, either directly following the option,
    (eg., -opt val1 val2) or values collected from multiple occurrences of
    the option (eg., -opt val1 -opt val2).
  """

  parser = ArgumentParser()
  parser.add_argument('-' + option, nargs='*', action='append')
  args, _ = parser.parse_known_args(argv)
  if not args or not vars(args)[option]:
    return []
  else:
    return sum(vars(args)[option], [])

def GetHostCompilerOptions(argv):
  """Collect the -isystem, -iquote, and --sysroot option values from argv.

  Args:
    argv: A list of strings, possibly the argv passed to main().

  Returns:
    The string that can be used as the --compiler-options to nvcc.
  """

  parser = ArgumentParser()
  parser.add_argument('-isystem', nargs='*', action='append')
  parser.add_argument('-iquote', nargs='*', action='append')
  parser.add_argument('--sysroot', nargs=1)
  parser.add_argument('-no-canonical-prefixes', dest='no_canonical_prefixes', action='store_true')
  parser.add_argument('-fno-canonical-system-headers', dest='fno_canonical_system_headers', action='store_true')
  parser.add_argument('-frandom-seed', dest='frandom_seed', nargs=1)
  parser.add_argument('-v', action='store_true')
  parser.add_argument('-fPIC', nargs='*', action='append')
  parser.add_argument('-g', nargs='*', action='append')
  parser.add_argument('-W', nargs='*', action='append')

  args, _ = parser.parse_known_args(argv)

  opts = ''

  isystem_args = args.isystem
  if isystem_args == None:
    isystem_args = []
  iquote_args = args.iquote
  # This hack is needed so that we can compile eigen3. We need to include
  # third_party/eigen3 with -I. Some eigen file include using the
  # include <Eigen/Core> syntax, and -iquote doesn't work for that.
  has_eigen = ['third_party/eigen3'] in isystem_args
  if has_eigen:
    isystem_args.remove(['third_party/eigen3'])

  if isystem_args:
    opts += '-isystem ' + ' -isystem '.join(sum(isystem_args, []))
  if iquote_args:
    opts += ' -iquote ' + ' -iquote '.join(sum(iquote_args, []))
  if args.g:
    opts += ' -g' + ' -g'.join(sum(args.g, []))
  if args.W:
    opts += ' -W' + ' -W'.join(sum(args.W, []))
  if args.sysroot:
    opts += ' --sysroot ' + args.sysroot[0]
  if has_eigen:
    opts += ' -I third_party/eigen3'
  if args.no_canonical_prefixes:
    opts += ' -no-canonical-prefixes'
  if args.fno_canonical_system_headers:
    opts += ' -fno-canonical-system-headers'
  if args.frandom_seed:
    opts += ' -frandom-seed=' + args.frandom_seed[0]
  if args.fPIC:
    opts += ' -fPIC'
  if args.v:
    opts += ' -v'

  return opts

def GetNvccOptions(argv):
  """Collect the -nvcc_options values from argv.

  Args:
    argv: A list of strings, possibly the argv passed to main().

  Returns:
    The string that can be passed directly to nvcc.
  """

  parser = ArgumentParser()
  parser.add_argument('-nvcc_options', nargs='*', action='append')

  args, _ = parser.parse_known_args(argv)

  if args.nvcc_options:
    return ' '.join(['--'+a for a in sum(args.nvcc_options, [])])
  return ''

def RemoveQuote(arg):
    if len(arg) > 0 and arg[0] == '\'':
        return arg[1:-1]
    return arg

def InvokeNvcc(argv, log=False):
  """Call nvcc with arguments assembled from argv.

  Args:
    argv: A list of strings, possibly the argv passed to main().
    log: True if logging is requested.

  Returns:
    The return value of calling os.system('nvcc ' + args)
  """

  argv=[RemoveQuote(arg) for arg in argv]
  host_compiler_options = GetHostCompilerOptions(argv)
  nvcc_compiler_options = GetNvccOptions(argv)
  opt_option = GetOptionValue(argv, 'O')
  m_options = GetOptionValue(argv, 'm')
  m_options = ''.join([' -m' + m for m in m_options if m in ['32', '64']])
  include_options = GetOptionValue(argv, 'I')
  out_file = GetOptionValue(argv, 'o')
  depfiles = GetOptionValue(argv, 'MF')
  defines = GetOptionValue(argv, 'D')
  defines = ''.join([' -D' + define for define in defines])
  undefines = GetOptionValue(argv, 'U')
  undefines = ''.join([' -U' + define for define in undefines])
  std_options = GetOptionValue(argv, 'std')

  # By default we use c++11 in CROSSTOOLS but we allow overriding.
  nvcc_allowed_std_options = {"c++03": "", "c++11": " -std=c++11"}
  std_options_list = [nvcc_allowed_std_options[define] for define in std_options if define in nvcc_allowed_std_options]
  if len(std_options_list) > 0:
      std_options = std_options_list[-1]
  else:
      std_options = ""

  # The list of source files get passed after the -c option. I don't know of
  # any other reliable way to just get the list of source files to be compiled.
  src_files = GetOptionValue(argv, 'c')

  if len(src_files) == 0:
    return 1
  if len(out_file) != 1:
    return 1
  out_file = out_file[0]

  opt = (' -O2' if (len(opt_option) > 0 and int(opt_option[0]) > 0)
         else ' -g -G')

  includes = (' -I ' + ' -I '.join(include_options)
              if len(include_options) > 0
              else '')

  # Unfortunately, there are other options that have -c prefix too.
  # So allowing only those look like cuda files.
  src_files = [f for f in src_files if
               re.search('\.cu$', f)]
  srcs = ' '.join(src_files)
  out = ' -o ' + out_file

  nvccopts = ''
  for capability in SUPPORTED_CUDA_COMPUTE_CAPABILITIES:
    capability = capability.replace('.', '')
    nvccopts += r'-gencode=arch=compute_%s,\"code=sm_%s,compute_%s\" ' % (
        capability, capability, capability)
  nvccopts += ' ' + nvcc_compiler_options
  nvccopts += undefines
  nvccopts += defines
  nvccopts += std_options
  nvccopts += m_options

  if depfiles:
    # Generate the dependency file
    depfile = depfiles[0]
    cmd = (NVCC_PATH + ' ' + nvccopts +
           ' --compiler-options "' + host_compiler_options + '"' +
           ' --compiler-bindir="' + GCC_HOST_COMPILER_PATH + '"' +
           ' -I .' +
           ' -x cu ' + includes + ' ' + srcs + ' -M -o ' + depfile)
    if log: Log(cmd)
    exit_status = os.system(cmd)
    if exit_status != 0:
      return exit_status

  cmd = (NVCC_PATH + ' ' + nvccopts +
         ' --compiler-options "' + host_compiler_options + '"' +
         ' --compiler-bindir="' + GCC_HOST_COMPILER_PATH + '"' +
         ' --keep' +
         ' -I .' +
         ' -x cu ' + opt + includes + ' -c ' + srcs + out)

  if log: Log(cmd)
  ret = os.system(cmd)
  if ret != 0:
      return ret

  with open(out_file, 'rb') as fin:
      obj = fin.read()

  for s in src_files:
      m = hashlib.sha256()
      m.update(s)
      my_hash = m.hexdigest()[:8]
      with open(s.split("/")[-1][:-3] + ".module_id", 'r') as fin:
          cudafe_module_id = fin.read().strip()[-17:] # "_cpp1_ii_xxxxxxxx"
      new_module_id = cudafe_module_id[:-8] + my_hash
      obj=obj.replace(cudafe_module_id, new_module_id)

  with open(out_file, 'wb') as fin:
      fin.write(obj)

  return 0

def IsCudaSource(argv):
    for fn in GetOptionValue(argv, 'c'):
        if fn.endswith('.cu'):
            return True
    return False

def main():
  parser = ArgumentParser()
  parser.add_argument('-x', nargs=1)
  parser.add_argument('--cuda_log', action='store_true')
  args, leftover = parser.parse_known_args(sys.argv[1:])

  if IsCudaSource(leftover):
    if args.cuda_log: Log('-x cuda')
    leftover = [pipes.quote(s) for s in leftover]
    return InvokeNvcc(leftover, log=args.cuda_log)

  # Strip our flags before passing through to the CPU compiler for files which
  # are not -x cuda. We can't just pass 'leftover' because it also strips -x.
  # We not only want to pass -x to the CPU compiler, but also keep it in its
  # relative location in the argv list (the compiler is actually sensitive to
  # this).
  cpu_compiler_flags = [flag for flag in sys.argv[1:]
                             if not flag.startswith(('--cuda_log'))]
  cmd = [CPU_COMPILER] + cpu_compiler_flags
  return subprocess.call(cmd)

if __name__ == '__main__':
  sys.exit(main())
