package(default_visibility = ["//visibility:public"])

licenses(["notice"])  # BSD/MIT-like license (for zlib)

prefix = "zlib-1.2.8/"

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
    copts = if_ios([
        "-includeunistd.h",
        ]),
)
