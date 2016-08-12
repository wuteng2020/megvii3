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

#genrule(
#    name = "config",
#    srcs = glob(
#        ["**/*"],
#        exclude = ["config.h"],
#    ),
#    outs = ["config.h"],
#    cmd = "pushd external/png_archive/; workdir=$$(mktemp -d -t tmp.XXXXXXXXXX); cp -a * $$workdir; pushd $$workdir; ./configure --enable-shared=no --with-pic=no; popd; popd; cp $$workdir/config.h $(@D); rm -rf $$workdir;",
#)

config_hardcoded = '#define HAVE_DLFCN_H 1\n\
#define HAVE_INTTYPES_H 1\n\
#define HAVE_LIBM 1\n\
#define HAVE_LIBZ 1\n\
#define HAVE_MALLOC_H 1\n\
#define HAVE_MEMORY_H 1\n\
#define HAVE_MEMSET 1\n\
#define HAVE_POW 1\n\
#define HAVE_STDINT_H 1\n\
#define HAVE_STDLIB_H 1\n\
#define HAVE_STRINGS_H 1\n\
#define HAVE_STRING_H 1\n\
#define HAVE_SYS_STAT_H 1\n\
#define HAVE_SYS_TYPES_H 1\n\
#define HAVE_UNISTD_H 1\n\
#define PACKAGE "libpng"\n\
#define PACKAGE_BUGREPORT "png-mng-implement@lists.sourceforge.net"\n\
#define PACKAGE_NAME "libpng"\n\
#define PACKAGE_STRING "libpng 1.2.53"\n\
#define PACKAGE_TARNAME "libpng"\n\
#define PACKAGE_URL ""\n\
#define PACKAGE_VERSION "1.2.53"\n\
#define STDC_HEADERS 1\n\
#define TM_IN_SYS_TIME 1\n\
#define VERSION "1.2.53"'

genrule(
    name = "config",
    outs = ["config.h"],
    cmd = "echo -e '%s' > $(@D)/config.h" % config_hardcoded,
)

cc_library(
    name = "png",
    srcs = PNG_SOURCES,
    hdrs = glob(["**/*.h"]) + [":config"],
    includes = ["."],
    visibility = ["//visibility:public"],
    deps = ["@zlib_archive//:zlib"]
)
