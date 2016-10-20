licenses(["reciprocal"])

cc_library(
    name = "intel-mkl",
    deps = if_x86_64([
        ":intel-mkl-64",
        ]) + if_x86_32([
        ":intel-mkl-32",
        ]),
    visibility = ["//visibility:public"],
    )

cc_library(
    name = "intel-mkl-64",
    srcs = [
               "libmkl_core_sequential_intel_ilp64.a",
           ],
    includes = [
            "include",
            ],
    hdrs = glob(["include/*.h"]),
    defines = [
                "MKL_ILP64",
                ],
)

genrule(
    name = "merge_archives-64",
    srcs = [
        "lib/intel64_lin/libmkl_core.a",
        "lib/intel64_lin/libmkl_sequential.a",
        "lib/intel64_lin/libmkl_intel_ilp64.a",
        ],
    outs = [
        "libmkl_core_sequential_intel_ilp64.a",
        ],
    cmd = "workdir=$$(mktemp -d -t tmp.XXXXXXXXXX); cp $(location lib/intel64_lin/libmkl_core.a) $(location lib/intel64_lin/libmkl_sequential.a) $(location lib/intel64_lin/libmkl_intel_ilp64.a) $${workdir}/; pushd $${workdir} > /dev/null; ar xf libmkl_core.a; ar xf libmkl_sequential.a; ar xf libmkl_intel_ilp64.a; popd > /dev/null; ar rcsD $(@D)/libmkl_core_sequential_intel_ilp64.a $${workdir}/*.o; rm -rf $$workdir;",
)

cc_library(
    name = "intel-mkl-32",
    srcs = [
               "libmkl_core_sequential_intel_32.a",
           ],
    includes = [
            "include",
            ],
    hdrs = glob(["include/*.h"]),
    deps = [
        "@//third_party/intel-mkl:workarounds",
        ],
)

genrule(
    name = "merge_archives-32",
    srcs = [
        "lib/ia32_lin/libmkl_core.a",
        "lib/ia32_lin/libmkl_sequential.a",
        "lib/ia32_lin/libmkl_intel.a",
        ],
    outs = [
        "libmkl_core_sequential_intel_32.a",
        ],
    cmd = "workdir=$$(mktemp -d -t tmp.XXXXXXXXXX); cp $(location lib/ia32_lin/libmkl_core.a) $(location lib/ia32_lin/libmkl_sequential.a) $(location lib/ia32_lin/libmkl_intel.a) $${workdir}/; pushd $${workdir} > /dev/null; ar xf libmkl_core.a; ar xf libmkl_sequential.a; ar xf libmkl_intel.a; popd > /dev/null; ar rcsD $(@D)/libmkl_core_sequential_intel_32.a $${workdir}/*.o; rm -rf $$workdir;",
)
