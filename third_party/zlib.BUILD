package(default_visibility = ["//visibility:public"])

licenses(["notice"])  # BSD/MIT-like license (for zlib)

# When you change this, make sure also change pnglib's zlib version
prefix = "zlib-1.2.11/"

cc_library(
    name = "zlib",
    srcs = if_not_mobile(glob([
        prefix + "*.c",
        ])),
    hdrs = if_not_mobile(glob([
        prefix + "*.h",
        ])),
    includes = if_not_mobile([
        prefix
        ]),
    copts = [
        "-includeunistd.h",
        ],
)
