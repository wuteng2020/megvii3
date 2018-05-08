SOURCES = [
    "jcapimin.c", "jcapistd.c", "jccoefct.c", "jccolor.c", "jcdctmgr.c", "jchuff.c",
    "jcinit.c", "jcmainct.c", "jcmarker.c", "jcmaster.c", "jcomapi.c", "jcparam.c",
    "jcphuff.c", "jcprepct.c", "jcsample.c", "jctrans.c", "jdapimin.c", "jdapistd.c",
    "jdatadst.c", "jdatasrc.c", "jdcoefct.c", "jdcolor.c", "jddctmgr.c", "jdhuff.c",
    "jdinput.c", "jdmainct.c", "jdmarker.c", "jdmaster.c", "jdmerge.c", "jdphuff.c",
    "jdpostct.c", "jdsample.c", "jdtrans.c", "jerror.c", "jfdctflt.c", "jfdctfst.c",
    "jfdctint.c", "jidctflt.c", "jidctfst.c", "jidctint.c", "jidctred.c", "jquant1.c",
    "jquant2.c", "jutils.c", "jmemmgr.c", "jmemnobs.c", "jaricom.c", "jcarith.c",
    "jdarith.c",
    ]

HEADERS = [
    "jerror.h",
    "jmorecfg.h",
    "jpeglib.h",
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

INTERNAL_HEADER_DEPS = [
    "@//third_party/jpeg:jconfig",
    "@//third_party/jpeg:jconfigint",
    ]

SIMD_C_SOURCES = if_x86_64([
    "simd/jsimd_x86_64.c",
    ]) + if_x86_32([
    "simd/jsimd_i386.c",
    ]) + if_aarch64([
    "simd/jsimd_arm64.c",
    "simd/jsimd_arm64_neon.S",
    ]) + if_armv7([
    "simd/jsimd_arm.c",
    "simd/jsimd_arm_neon.S",
    ])

SIMD_X86_64_NASM_SOURCES = [
    "jccolor-sse2-64.asm",
    "jcgray-sse2-64.asm",
    "jchuff-sse2-64.asm",
    "jcsample-sse2-64.asm",
    "jdcolor-sse2-64.asm",
    "jdmerge-sse2-64.asm",
    "jdsample-sse2-64.asm",
    "jfdctfst-sse2-64.asm",
    "jfdctint-sse2-64.asm",
    "jidctflt-sse2-64.asm",
    "jidctfst-sse2-64.asm",
    "jidctint-sse2-64.asm",
    "jidctred-sse2-64.asm",
    "jquantf-sse2-64.asm",
    "jquanti-sse2-64.asm",

    "jfdctflt-sse-64.asm",
    ]

SIMD_X86_64_NASM_OBJECTS = [
    foo + ".o" for foo in SIMD_X86_64_NASM_SOURCES 
    ]

SIMD_X86_32_NASM_SOURCES = [
    "jccolor-sse2.asm",
    "jcgray-sse2.asm",
    "jchuff-sse2.asm",
    "jcsample-sse2.asm",
    "jdcolor-sse2.asm",
    "jdmerge-sse2.asm",
    "jdsample-sse2.asm",
    "jfdctfst-sse2.asm",
    "jfdctint-sse2.asm",
    "jidctflt-sse2.asm",
    "jidctfst-sse2.asm",
    "jidctint-sse2.asm",
    "jidctred-sse2.asm",
    "jquantf-sse2.asm",
    "jquanti-sse2.asm",

    "jfdctflt-sse.asm",
    "jidctflt-sse.asm",
    "jquant-sse.asm",

    "jfdctflt-3dn.asm",
    "jidctflt-3dn.asm",
    "jquant-3dn.asm",

    "jccolor-mmx.asm",
    "jcgray-mmx.asm",
    "jcsample-mmx.asm",
    "jdcolor-mmx.asm",
    "jdmerge-mmx.asm",
    "jdsample-mmx.asm",
    "jfdctfst-mmx.asm",
    "jfdctint-mmx.asm",
    "jidctfst-mmx.asm",
    "jidctint-mmx.asm",
    "jidctred-mmx.asm",
    "jquant-mmx.asm",

    "jsimdcpu.asm",
    ]

SIMD_X86_32_NASM_OBJECTS = [
    foo + ".o" for foo in SIMD_X86_32_NASM_SOURCES 
    ]

SIMD_C_HEADERS = glob([
    "simd/*.h",
    ])

SIMD_NASM_HEADERS = glob([
    "simd/*.inc",
    "simd/jccolext-sse2-64.asm",
    "simd/jcgryext-sse2-64.asm",
    "simd/jdcolext-sse2-64.asm",
    "simd/jdmrgext-sse2-64.asm",
    "simd/jccolext-sse2.asm",
    "simd/jcgryext-sse2.asm",
    "simd/jdcolext-sse2.asm",
    "simd/jdmrgext-sse2.asm",
    "simd/jccolext-mmx.asm",
    "simd/jcgryext-mmx.asm",
    "simd/jdcolext-mmx.asm",
    "simd/jdmrgext-mmx.asm",
    ])

SIMD_NONE = [
    "jsimd_none.c",
    ]

[genrule(
    name = "gen-" + foo + ".o",
    srcs = ["simd/" + foo] + SIMD_NASM_HEADERS + ["@//third_party/jpeg:jsimdcfg"],
    tools = ["@nasm_archive//:nasm"],
    outs = [foo + ".o"],
    cmd = "$(location @nasm_archive//:nasm) $(location simd/%s) -felf64 -DELF -D__x86_64__ -DPIC -I$$(dirname $(location @//third_party/jpeg:jsimdcfg))/ -I$$(dirname $(location simd/%s))/ -o $(@D)/%s.o" % (foo, foo, foo),
    ) for foo in SIMD_X86_64_NASM_SOURCES]

[genrule(
    name = "gen-" + foo + ".o",
    srcs = ["simd/" + foo] + SIMD_NASM_HEADERS + ["@//third_party/jpeg:jsimdcfg"],
    tools = ["@nasm_archive//:nasm"],
    outs = [foo + ".o"],
    cmd = "$(location @nasm_archive//:nasm) $(location simd/%s) -felf -DELF -DPIC -I$$(dirname $(location @//third_party/jpeg:jsimdcfg))/ -I$$(dirname $(location simd/%s))/ -o $(@D)/%s.o" % (foo, foo, foo),
    ) for foo in SIMD_X86_32_NASM_SOURCES]

cc_library(
    name = "jpeg",
    srcs = SOURCES + INTERNAL_HEADERS,
    hdrs = HEADERS,
    deps = INTERNAL_HEADER_DEPS + [
        ":jpeg_simd",
        ],
    copts = [
        "-includelimits.h",
        ],
    includes = ["."],
    visibility = ["//visibility:public"],
    )

cc_library(
    name = "jpeg_simd",
    srcs = SIMD_C_SOURCES + INTERNAL_HEADERS + SIMD_C_HEADERS + if_x86_64(SIMD_X86_64_NASM_OBJECTS) + if_x86_32(SIMD_X86_32_NASM_OBJECTS) + if_mips(SIMD_NONE),
    hdrs = HEADERS,
    deps = INTERNAL_HEADER_DEPS,
    copts = [
        "-includelimits.h",
        "-Iexternal/jpeg_archive/simd",
        ] + if_armv7([
        "-Wno-unused-function",    # We force neon, causing parse_proc_cpuinfo to be unused.
        ]),
    )

cc_megvii_shared_object(
    name = "jpeg_shared",
    deps = [
        ":jpeg",
        ],
    )

cc_megvii_test(
    name = "jcstest",
    srcs = [
        "jcstest.c",
        ],
    internal_deps = [
        ":jpeg",
        ],
    )

cc_megvii_test(
    name = "tjunittest",
    srcs = [
        "tjunittest.c",
        "turbojpeg.c",
        "tjutil.c",
        "jdatadst-tj.c",
        "jdatasrc-tj.c",
        "transupp.c",
        "turbojpeg.h",
        ],
    internal_deps = [
        ":jpeg",
        ],
    )
