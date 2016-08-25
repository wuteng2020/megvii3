licenses(["notice"])  # Apache 2.0

filegroup(
    name = "srcs",
    srcs = glob(["**"]),
    visibility = ["//tools:__pkg__"],
)

exports_files(
    ["README.md"],
    visibility = ["//site:__pkg__"],
)

py_library(
    name = "archive",
    srcs = ["archive.py"],
)

py_binary(
    name = "build_tar",
    srcs = ["build_tar.py"],
    visibility = ["//visibility:public"],
    deps = [
        "@bazel_tools//third_party/py/gflags",
        ":archive",
    ],
)
