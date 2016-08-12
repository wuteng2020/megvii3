SOURCES = [
    "jcapimin.c",
    "jcapistd.c", "jccoefct.c", "jccolor.c", "jcdctmgr.c", "jchuff.c", "jcinit.c",
    "jcmainct.c", "jcmarker.c", "jcmaster.c", "jcomapi.c", "jcparam.c", "jcphuff.c",
    "jcprepct.c", "jcsample.c", "jctrans.c", "jdapimin.c", "jdapistd.c",
    "jdatadst.c", "jdatasrc.c", "jdcoefct.c", "jdcolor.c", "jddctmgr.c", "jdhuff.c",
    "jdinput.c", "jdmainct.c", "jdmarker.c", "jdmaster.c", "jdmerge.c", "jdphuff.c",
    "jdpostct.c", "jdsample.c", "jdtrans.c", "jerror.c", "jfdctflt.c", "jfdctfst.c",
    "jfdctint.c", "jidctflt.c", "jidctfst.c", "jidctint.c", "jidctred.c",
    "jquant1.c", "jquant2.c", "jutils.c", "jmemmgr.c", "jmemnobs.c", "jaricom.c",
    "jcarith.c", "jdarith.c", "jsimd_none.c",
    ]

HEADERS = [
    "jerror.h",
    "jmorecfg.h",
    "jpeglib.h",
    "turbojpeg.h",
    # FIXME: they aren't really public headers but we have nowhere else to put them
    "jccolext.c",
    "jdcol565.c",
    "jdcolext.c",
    "jdmrg565.c",
    "jdmrgext.c",
    "jstdhuff.c",
    ]

INTERNAL_HEADERS = glob([
    "*.h"
    ])

SIMD_SOURCES = glob([
    ])

SIMD_HEADERS = glob([
    "simd/*.h"
    ])

genrule(
    name = "config",
    srcs = glob(
        ["**/*"],
        exclude = ["jconfig.h"],
    ),
    outs = [
        "jconfig.h",
        "jconfigint.h",
        ],
    cmd = "pushd external/jpeg_archive/; workdir=$$(mktemp -d -t tmp.XXXXXXXXXX); cp -a * $$workdir; pushd $$workdir; ./configure --without-simd; popd; popd; cp $$workdir/{jconfig,jconfigint}.h $(@D)/; rm -rf $$workdir;",
)

cc_library(
    name = "jpeg",
    srcs = SOURCES + INTERNAL_HEADERS,
    hdrs = HEADERS + [":config"],
    deps = [":jpeg_simd"],
    includes = ["."],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "jpeg_simd",
    srcs = SIMD_SOURCES + INTERNAL_HEADERS + SIMD_HEADERS,
    hdrs = HEADERS + [":config"],
    copts = ["-Iexternal/jpeg_archive/simd"],
)
