package(default_visibility = ["//visibility:public"])

licenses(["notice"])  # BSD/MIT-like license (for zlib)

prefix = "zlib-1.2.10/"

cc_library(
    name = "zlib",
    srcs = if_not_android(glob([
        prefix + "*.c",
        ])),
    hdrs = if_not_android(glob([
        prefix + "*.h",
        ])),
    includes = if_not_android([
        prefix
        ]),
    copts = [
        "-includeunistd.h",
        ],
)
