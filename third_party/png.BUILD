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
]

genrule(
    name = "config",
    srcs = glob(
        ["**/*"],
        exclude = ["config.h"],
    ),
    outs = ["config.h"],
    cmd = "pushd external/png_archive/; workdir=$$(mktemp -d -t tmp.XXXXXXXXXX); cp -a * $$workdir; pushd $$workdir; ./configure --enable-shared=no --with-pic=no; popd; popd; cp $$workdir/config.h $(@D); rm -rf $$workdir;",
)

cc_library(
    name = "png",
    srcs = PNG_SOURCES,
    hdrs = glob(["**/*.h"]) + [":config"],
    includes = ["."],
    visibility = ["//visibility:public"],
    deps = ["@zlib_archive//:zlib"]
)
