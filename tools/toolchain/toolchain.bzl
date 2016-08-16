def if_tk1(a):
    return select({
        "//tools/toolchain:tk1": a,
        "//conditions:default": [],
        })

def if_armv7(a):
    return select({
        "//tools/toolchain:tk1": a,
        "//tools/toolchain:android_armv7": a,
        "//conditions:default": [],
        })

def if_tx1(a):
    return select({
        "//tools/toolchain:tx1": a,
        "//conditions:default": [],
        })

def if_aarch64(a):
    return select({
        "//tools/toolchain:tx1": a,
        "//tools/toolchain:android_aarch64": a,
        "//conditions:default": [],
        })

def if_arm(a):
    return select({
        "//tools/toolchain:tk1": a,
        "//tools/toolchain:tx1": a,
        "//tools/toolchain:android_armv7": a,
        "//tools/toolchain:android_aarch64": a,
        "//conditions:default": [],
        })

def if_x86_64(a):
    return select({
        "//tools/toolchain:x86_64": a,
        "//conditions:default": [],
        })

def if_x86(a):
    return select({
        "//tools/toolchain:x86_64": a,
        "//conditions:default": [],
        })

def if_not_x86(a):
    return select({
        "//tools/toolchain:x86_64": [],
        "//conditions:default": a,
        })

def x86_select(a, b):
    return select({
        "//tools/toolchain:x86_64": a,
        "//conditions:default": b,
        })

def if_cuda(a):
    return select({
        "//tools/toolchain:gcc_cuda": a,
        "//conditions:default": [],
        })

def if_cuda_with_fp16(a):
    return select({
        "//tools/toolchain:tx1_gcc_cuda": a,
        "//tools/toolchain:x86_64_gcc_cuda": a,
        "//conditions:default": [],
        })

def if_linux(a):
    return select({
        "//tools/toolchain:x86_84": a,
        "//tools/toolchain:tk1": a,
        "//tools/toolchain:tx1": a,
        "//conditions:default": [],
        })

def if_android(a):
    return select({
        "//tools/toolchain:android_armv7": a,
        "//tools/toolchain:android_aarch64": a,
        "//conditions:default": [],
        })

# Platform-specific cc_libraries.
# Use them when you have libraries that you don't necessarily want to be built under certain toolchains.
# Be careful though, since Bazel does not support nested select() for now, using them could be problematic.

def cc_cuda_library(name, deps = None, srcs = None, data = None, hdrs = None, alwayslink = 0, compatible_with = None, copts = None, defines = None, deprecation = None, distribs = None, features = [], includes = None, licenses = None, linkopts = None, linkstatic = 0, nocopts = None, restricted_to = None, tags = [], testonly = 0, textual_hdrs = None, visibility = None):
    native.cc_library(
        name = name,

        deps = if_cuda(deps),
        srcs = if_cuda(srcs),
        data = if_cuda(data),
        hdrs = if_cuda(hdrs),
        copts = if_cuda(copts),
        defines = if_cuda(defines),
        includes = if_cuda(includes),
        linkopts = if_cuda(linkopts),
        textual_hdrs = if_cuda(textual_hdrs),

        nocopts = nocopts,
        linkstatic = linkstatic,
        alwayslink = alwayslink,
        compatible_with = compatible_with,
        deprecation = deprecation,
        distribs = distribs,
        features = features,
        licenses = licenses,
        restricted_to = restricted_to,
        tags = tags,
        testonly = testonly,
        visibility = visibility,
    )

def cc_armv7_library(name, deps = None, srcs = None, data = None, hdrs = None, alwayslink = 0, compatible_with = None, copts = None, defines = None, deprecation = None, distribs = None, features = [], includes = None, licenses = None, linkopts = None, linkstatic = 0, nocopts = None, restricted_to = None, tags = [], testonly = 0, textual_hdrs = None, visibility = None):
    native.cc_library(
        name = name,

        deps = if_armv7(deps),
        srcs = if_armv7(srcs),
        data = if_armv7(data),
        hdrs = if_armv7(hdrs),
        copts = if_armv7(copts),
        defines = if_armv7(defines),
        includes = if_armv7(includes),
        linkopts = if_armv7(linkopts),
        textual_hdrs = if_armv7(textual_hdrs),

        nocopts = nocopts,
        linkstatic = linkstatic,
        alwayslink = alwayslink,
        compatible_with = compatible_with,
        deprecation = deprecation,
        distribs = distribs,
        features = features,
        licenses = licenses,
        restricted_to = restricted_to,
        tags = tags,
        testonly = testonly,
        visibility = visibility,
    )

def cc_aarch64_library(name, deps = None, srcs = None, data = None, hdrs = None, alwayslink = 0, compatible_with = None, copts = None, defines = None, deprecation = None, distribs = None, features = [], includes = None, licenses = None, linkopts = None, linkstatic = 0, nocopts = None, restricted_to = None, tags = [], testonly = 0, textual_hdrs = None, visibility = None):
    native.cc_library(
        name = name,

        deps = if_aarch64(deps),
        srcs = if_aarch64(srcs),
        data = if_aarch64(data),
        hdrs = if_aarch64(hdrs),
        copts = if_aarch64(copts),
        defines = if_aarch64(defines),
        includes = if_aarch64(includes),
        linkopts = if_aarch64(linkopts),
        textual_hdrs = if_aarch64(textual_hdrs),

        nocopts = nocopts,
        linkstatic = linkstatic,
        alwayslink = alwayslink,
        compatible_with = compatible_with,
        deprecation = deprecation,
        distribs = distribs,
        features = features,
        licenses = licenses,
        restricted_to = restricted_to,
        tags = tags,
        testonly = testonly,
        visibility = visibility,
    )

def cc_arm_library(name, deps = None, srcs = None, data = None, hdrs = None, alwayslink = 0, compatible_with = None, copts = None, defines = None, deprecation = None, distribs = None, features = [], includes = None, licenses = None, linkopts = None, linkstatic = 0, nocopts = None, restricted_to = None, tags = [], testonly = 0, textual_hdrs = None, visibility = None):
    native.cc_library(
        name = name,

        deps = if_arm(deps),
        srcs = if_arm(srcs),
        data = if_arm(data),
        hdrs = if_arm(hdrs),
        copts = if_arm(copts),
        defines = if_arm(defines),
        includes = if_arm(includes),
        linkopts = if_arm(linkopts),
        textual_hdrs = if_arm(textual_hdrs),

        nocopts = nocopts,
        linkstatic = linkstatic,
        alwayslink = alwayslink,
        compatible_with = compatible_with,
        deprecation = deprecation,
        distribs = distribs,
        features = features,
        licenses = licenses,
        restricted_to = restricted_to,
        tags = tags,
        testonly = testonly,
        visibility = visibility,
    )

def cc_x86_64_library(name, deps = None, srcs = None, data = None, hdrs = None, alwayslink = 0, compatible_with = None, copts = None, defines = None, deprecation = None, distribs = None, features = [], includes = None, licenses = None, linkopts = None, linkstatic = 0, nocopts = None, restricted_to = None, tags = [], testonly = 0, textual_hdrs = None, visibility = None):
    native.cc_library(
        name = name,

        deps = if_x86_64(deps),
        srcs = if_x86_64(srcs),
        data = if_x86_64(data),
        hdrs = if_x86_64(hdrs),
        copts = if_x86_64(copts),
        defines = if_x86_64(defines),
        includes = if_x86_64(includes),
        linkopts = if_x86_64(linkopts),
        textual_hdrs = if_x86_64(textual_hdrs),

        nocopts = nocopts,
        linkstatic = linkstatic,
        alwayslink = alwayslink,
        compatible_with = compatible_with,
        deprecation = deprecation,
        distribs = distribs,
        features = features,
        licenses = licenses,
        restricted_to = restricted_to,
        tags = tags,
        testonly = testonly,
        visibility = visibility,
    )
