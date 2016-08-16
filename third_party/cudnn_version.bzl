def if_cudnn_v4(a):
    return select({
        "//tools/toolchain:tk1_gcc_cuda": a,
        "//tools/toolchain:tx1_gcc_cuda": a,
        "//conditions:default": [],
        })

def if_cudnn_v5(a):
    return select({
        "//tools/toolchain:x86_64_gcc_cuda": a,
        "//conditions:default": [],
        })
