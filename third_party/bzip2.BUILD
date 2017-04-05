package(default_visibility = ["//visibility:public"])

licenses(["notice"])

cc_library(
    name = "bz2lib",
    srcs = if_not_ios([
        "bzlib.c",
        "blocksort.c",
        "crctable.c",
        "compress.c",
        "decompress.c",
        "huffman.c",
        "randtable.c",
        ]),
    hdrs = if_not_ios(glob([
        "*.h",
        ])),
    includes = if_not_ios([
        ".",
        ]),
)
