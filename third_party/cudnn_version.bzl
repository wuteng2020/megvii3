def if_cudnn_v4(a):
    return select({
        "//tools/toolchain:tk1_gcc_cuda": a,
        "//conditions:default": [],
        })

def if_cudnn_v5(a):
    return select({
        "//tools/toolchain:x86_64_gcc4_cuda7": a,
        "//tools/toolchain:x86_64_gcc4_cuda8": a,
        "//tools/toolchain:x86_64_gcc5_cuda8": a,
        "//tools/toolchain:tx1_gcc_cuda": a,
        "//conditions:default": [],
        })
