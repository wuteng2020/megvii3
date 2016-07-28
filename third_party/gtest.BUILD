licenses(["permissive"])

prefix_dir = "gtest-1.7.0"
root_prefix_dir = "external/gtest_archive/" + prefix_dir

cc_library(
    name = "gtest",
    hdrs = glob([
        prefix_dir + "/include/**/*.h",
        prefix_dir + "/src/*.cc",
    ]),
    srcs = glob([
        prefix_dir + "/src/gtest-all.cc",
        prefix_dir + "/src/*.h",
    ]),
    includes = [
        prefix_dir + "/include",
    ],
    copts = [
        "-I%s" % root_prefix_dir,
        "-I%s/include" % root_prefix_dir,
    ],
    linkopts = ["-pthread"],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "gtest_main",
    srcs = [
        prefix_dir + "src/gtest_main.cc",
        ],
    linkopts = ["-pthread"],
    deps = [":gtest"],

    visibility = ["//visibility:public"],
)
