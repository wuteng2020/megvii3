package(default_visibility = ["//visibility:public"])

licenses(["notice"])  # BSD/MIT-like license (for zlib)

cc_library(
    name = "zlib",
    srcs = if_not_android(glob([
        "*.c",
        ])),
    hdrs = if_not_android(glob([
        "*.h",
        ])),
    includes = if_not_android([
        ".",
        ]),
    copts = if_ios([
        "-includeunistd.h",
        ]),
)
