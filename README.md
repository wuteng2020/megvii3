Megvii3
=======
This repository uses git submodules to organize all production code of Megvii Research & Infrastructure.

In addition, this repository includes toolchains and respective configuration files that helps making deterministic builds across different systems.

Prerequisite
------------
You need jdk7 or higher, and a working GCC to run Bazel. We do not actually use JDK or system GCC to build anything.

You need `python2` available at `/usr/bin/python`, and common tools like `sed`, `awk`, `tar` and `perl` in your `PATH` too. We will try hard to not depend on a particular distribution, but a sane environment is still desired.

You need to enable user namespaces in your Linux kernel. `sysctl kernel.unprivileged_userns_clone=1` should do the trick but if it does not, you might need to rebuild your kernel.

Finally, you need a special Bazel version available at ftp://10.203.1.81/pub/megvii3/bazel-0.3.1-r3-jdk7.

Initializing
------------
Use the following commands to mark/unmark a subproject you are interested in.
`git submodule init <submodule name>`
`git submodule deinit <submodule name>`

Then, type
`git submodule update`

You also want to do `git submodule update` after `git pull`ing.

Building and testing a target
-----------------------------
`bazel build //direct/to/your/project:target_name`
`bazel test //direct/to/your/project:test_target_name`

For optimized ("release") builds, add `-c opt`.

Use `...` to denote "all subdirectories" and `all` to denote "all targets". So if you want to build everything, use
`bazel build //...:all`

Notice that you have to work on a machine with a CUDA-enabled card to properly test everything.

Styles & Etiquitte
------------------
Always use lower-case directory names. Don't force people to remember capitalization patterns.

Using `includes`, `defines` or using `-I` in `copts` is *not* recommended.
Include statements with detailed path is preferred. Read the Bazel documentation on this for further information.

`git pull`, `git submodule update`, and run tests before trying to push anything to the master branch.

For server applications, prefer to build one version that supports multiple situations, than tailoring multiple versions.
This does not apply to embedded application, however, as size might be important.

Toolchains
----------
Currently you need to make sure your code compiles under the following toolchains:
* `x86_64`
* `x86 without CUDA`: `--compiler=gcc`
* `TX1`: `--cpu=tx1`
* `Android ARMV7`: `--cpu=android_armv7`
* `Android AArch64`: `--cpu=android_aarch64`
* `iOS ARMV7`: `--cpu=ios_armv7`
* `iOS AArch64`: `--cpu=ios_aarch64`

If your project actually does not support one or more of above architectures, please use `select()` to clear your `srcs` and `deps` in such configurations.

In addition, the following toolchains are provided for your interest, but you are not obliged to maintain your code for them. Still, if you know for sure your project does not compile under certain toolchains, it's better to mask them with `select()`.
* `x86_64` with GCC 4.9.x: `--cpu=k8_gcc4`
* `TK1`: `--cpu=tk1`
