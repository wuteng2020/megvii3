package(default_visibility = ["//visibility:public"])

PNG_SOURCES = [
    "png.c",
    "pngerror.c",
    "pngget.c",
    "pngmem.c",
    "pngpread.c",
    "pngread.c",
    "pngrio.c",
    "pngrtran.c",
    "pngrutil.c",
    "pngset.c",
    "pngtrans.c",
    "pngwio.c",
    "pngwrite.c",
    "pngwtran.c",
    "pngwutil.c",
] + if_arm([
    "arm/arm_init.c",
    "arm/filter_neon_intrinsics.c",
])

cc_library(
    name = "png",
    srcs = PNG_SOURCES,
    hdrs = glob(["**/*.h"]),
    includes = ["."],
    visibility = ["//visibility:public"],
    deps = [
        "@zlib_archive//:zlib",
        "@//third_party/png:pnglibconf",
        "@//third_party/png:config",
        ],
    copts = [
        "-Ithird_party/png/",
        "-DHAVE_CONFIG_H",
        ],
)

filegroup(
    name = "pngtest_files",
    srcs = [
        "pngtest.png",
        ],
    )

genrule(
    name = "pngtest_sed",
    srcs = [
        "pngtest.c",
        ],
    outs = [
        "pngtest_sed.c",
        ],
    cmd = "sed 's=pngtest\\.png=external/png_archive/pngtest.png=g' $(location pngtest.c) > $(@D)/pngtest_sed.c",
    )

cc_megvii_test(
    name = "pngtest",
    srcs = ["pngtest_sed.c"],
    internal_deps = [":png"],
    copts = [
        "-Ithird_party/png/",
        "-DHAVE_CONFIG_H",
        ],
    data = [
        ":pngtest_files",
        ],
    size = "small",
    )
