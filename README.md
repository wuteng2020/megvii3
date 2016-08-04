Megvii3
=======
This repository uses git submodules to organize all production code of Megvii Research & Infrastructure.

In addition, this repository includes toolchains and respective configuration files that helps making deterministic builds across different systems.

Styles & Etiquitte
------------------
Always use lower-case directory names. Don't force people to remember capitalization patterns.

Using `includes`, `defines` or using `-I` in `copts` is *not* recommended.
Include statements with detailed path is preferred. Read the Bazel documentation on this for further information.

Run tests before merging anything to the master branch.

For server applications, prefer to build one version that supports multiple situations, than tailoring multiple versions.
This does not apply to embedded application, however, as size might be important.
