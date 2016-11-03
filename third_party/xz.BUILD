package(default_visibility = ["//visibility:public"])

licenses(["notice"])

cc_library(
    name = "lzma",
    srcs = glob([
        "src/liblzma/**/*.c",
        "src/liblzma/**/*.h",
        "src/common/**/*.h",
        "src/common/**/*.c",
        ], exclude = [
        "src/liblzma/check/crc32_small.c",
        "src/liblzma/check/crc64_small.c",
        "src/liblzma/check/crc32_tablegen.c",
        "src/liblzma/check/crc64_tablegen.c",
        "src/liblzma/rangecoder/price_tablegen.c",
        "src/liblzma/lzma/fastpos_tablegen.c",
        ]),
    hdrs = glob([
        "src/liblzma/api/*.h",
        ]),
    includes = [
        "src/liblzma/api",
        ],
    copts = [
        "-Iexternal/xz_archive/src/liblzma/api/common",
        "-Iexternal/xz_archive/src/liblzma/check",
        "-Iexternal/xz_archive/src/liblzma/common",
        "-Iexternal/xz_archive/src/liblzma/delta",
        "-Iexternal/xz_archive/src/liblzma/lz",
        "-Iexternal/xz_archive/src/liblzma/lzma",
        "-Iexternal/xz_archive/src/liblzma/rangecoder",
        "-Iexternal/xz_archive/src/liblzma/simple",
        "-Iexternal/xz_archive/src/common",
        "-Ithird_party/xz",
        "-DHAVE_CONFIG_H",
        "-std=c99",
        ],
    deps = [
        "@//third_party/xz:config",
        ],
)
