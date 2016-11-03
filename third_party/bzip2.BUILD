package(default_visibility = ["//visibility:public"])

licenses(["notice"])

cc_library(
    name = "bz2lib",
    srcs = [
        "bzlib.c",
        "blocksort.c",
        "crctable.c",
        "compress.c",
        "decompress.c",
        "huffman.c",
        "randtable.c",
        ],
    hdrs = glob([
        "*.h",
        ]),
    includes = [
        ".",
        ],
)
