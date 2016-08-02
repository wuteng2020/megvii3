def if_tk1(a):
    return select({
        "//tools/toolchain:tk1": a,
        "//conditions:default": [],
        })

def if_armv7(a):
    return select({
        "//tools/toolchain:tk1": a,
        "//conditions:default": [],
        })

def if_x86_64(a):
    return select({
        "//tools/toolchain:x86_64": a,
        "//conditions:default": [],
        })
