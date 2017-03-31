cc_library(
    name = "benchmark",
    copts = [
        "-DHAVE_STD_REGEX",
    ],
    srcs = glob([
        "src/*.h",
        "src/*.cc",
    ]),
    hdrs = glob([
        "include/benchmark/*.h",
    ]),
    includes = ["include"],
    visibility = ["//visibility:public"],
)

[cc_megvii_test(
    name = "benchmark.test." + f[5:-3],
    copts = [
        "-DHAVE_STD_REGEX",
    ],
    srcs = [f] + glob([
        "test/*.h",
        "test/output_test_helper.cc",
    ]),
    internal_deps = [":benchmark"],
) for f in glob(
    ["test/*.cc"],
    exclude = [
        "test/cxx03_test.cc",
        "test/output_test_helper.cc",
    ],
)]

