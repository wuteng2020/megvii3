#!/bin/bash

bazel build "$@" --copt -DMIDOUT_PROFILING -c dbg
