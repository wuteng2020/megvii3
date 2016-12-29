licenses(["permissive"])

root_prefix_dir = "external/gtest_archive/"

cc_library(
    name = "gtest",
    hdrs = glob([
        "include/**/*.h",
        "src/*.cc",
    ]),
    srcs = glob([
        "src/gtest-all.cc",
        "src/*.h",
    ]),
    includes = [
        "include",
    ],
    copts = [
        "-I%s" % root_prefix_dir,
    ],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "gtest_main",
    srcs = [
        "src/gtest_main.cc",
        ],
    deps = [":gtest"],

    visibility = ["//visibility:public"],
)
