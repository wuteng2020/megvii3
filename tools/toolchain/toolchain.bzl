###################### Particular platform checks
def if_tk1(a):
    return tk1_select(a, [])

def if_not_tk1(a):
    return tk1_select([], a)

def tk1_select(a, b):
    return select({
        "@//tools/toolchain:cpu_tk1": a,
        "@//conditions:default": b,
        })

def if_tx1(a):
    return tx1_select(a, [])

def if_not_tx1(a):
    return tx1_select([], a)

def tx1_select(a, b):
    return select({
        "@//tools/toolchain:cpu_tx1": a,
        "@//conditions:default": b,
        })

def if_c3s(a):
    return c3s_select(a, [])

def if_not_c3s(a):
    return c3s_select([], a)

def c3s_select(a, b):
    return select({
        "@//tools/toolchain:cpu_c3s": a,
        "@//conditions:default": b,
        })

def if_mips(a):
    return mips_select(a, [])

def if_not_mips(a):
    return mips_select([], a)

def mips_select(a, b):
    return arch_select(b, b, b, b, b, a)

def if_android_armv7(a):
    return android_armv7_select(a, [])

def if_not_android_armv7(a):
    return android_armv7_select([], a)

def android_armv7_select(a, b):
    return select({
        "@//tools/toolchain:android_armv7": a,
        "@//conditions:default": b,
        })

def if_android_aarch64(a):
    return android_aarch64_select(a, [])

def if_not_android_aarch64(a):
    return android_aarch64_select([], a)

def android_aarch64_select(a, b):
    return select({
        "@//tools/toolchain:android_aarch64": a,
        "@//conditions:default": b,
        })

def if_android_x86_32(a):
    return android_x86_32_select(a, [])

def if_not_android_x86_32(a):
    return android_x86_32_select([], a)

def android_x86_32_select(a, b):
    return select({
        "@//tools/toolchain:android_x86_32": a,
        "@//tools/toolchain:android_x86_32_sse3": a,
        "@//conditions:default": b,
        })

def if_android_x86_32_sse4(a):
    return android_x86_32_sse4_select(a, [])

def if_not_android_x86_32_sse4(a):
    return android_x86_32_sse4_select([], a)

def android_x86_32_sse4_select(a, b):
    return select({
        "@//tools/toolchain:android_x86_32": a,
        "@//conditions:default": b,
        })

def if_ios_armv7(a):
    return ios_armv7_select(a, [])

def if_not_ios_armv7(a):
    return ios_armv7_select([], a)

def ios_armv7_select(a, b):
    return select({
        "@//tools/toolchain:ios_armv7": a,
        "@//tools/toolchain:ios_armv7s": a,
        "@//conditions:default": b,
        })

def if_ios_aarch64(a):
    return ios_aarch64_select(a, [])

def if_not_ios_aarch64(a):
    return ios_aarch64_select([], a)

def ios_aarch64_select(a, b):
    return select({
        "@//tools/toolchain:ios_aarch64": a,
        "@//conditions:default": b,
        })

###################### Architecture checks
def if_armv7(a):
    return armv7_select(a, [])

def if_not_armv7(a):
    return armv7_select([], a)

def armv7_select(a, b):
    return arch_select(b, b, a, b, b, b)

def if_aarch64(a):
    return aarch64_select(a, [])

def if_not_aarch64(a):
    return aarch64_select([], a)

def aarch64_select(a, b):
    return arch_select(b, b, b, a, b, b)

def if_arm(a):
    return arm_select(a, [])

def if_not_arm(a):
    return arm_select([], a)

def arm_select(a, b):
    return arch_select(b, b, a, a, b, b)

def if_x86_32(a):
    return x86_32_select(a, [])

def if_not_x86_32(a):
    return x86_32_select([], a)

def x86_32_select(a, b):
    return arch_select(b, a, b, b, a, b)

def if_x86_32_sse3(a):
    return x86_32_sse3_select(a, [])

def if_not_x86_32_sse3(a):
    return x86_32_sse3_select([], a)

def x86_32_sse3_select(a, b):
    return arch_select(b, b, b, b, a, b)

def if_x86_32_sse4(a):
    return x86_32_sse4_select(a, [])

def if_not_x86_32_sse4(a):
    return x86_32_sse4_select([], a)

def x86_32_sse4_select(a, b):
    return arch_select(b, a, b, b, b, b)

def if_x86_64(a):
    return x86_64_select(a, [])

def if_not_x86_64(a):
    return x86_64_select([], a)

def x86_64_select(a, b):
    return arch_select(a, b, b, b, b, b)

def if_x86(a):
    return x86_select(a, [])

def if_not_x86(a):
    return x86_select([], a)

def x86_select(a, b):
    return arch_select(a, a, b, b, a, b)

def if_x86_sse4(a):
    return x86_sse4_select(a, [])

def if_not_x86_sse4(a):
    return x86_sse4_select([], a)

def x86_sse4_select(a, b):
    return arch_select(a, a, b, b, b, b)

def if_wordsize_32(a):
    return wordsize_select(a, [])

def if_not_wordsize_32(a):
    return wordsize_select([], a)

def wordsize_32_select(a, b):
    return wordsize_select(a, b)

def if_wordsize_64(a):
    return wordsize_select([], a)

def if_not_wordsize_64(a):
    return wordsize_select(a, [])

def wordsize_64_select(a, b):
    return wordsize_select(b, a)

def wordsize_select(a_32, a_64):
    return arch_select(a_64, a_32, a_32, a_64, a_32, a_32)

def arch_select(x86_64, x86_32, armv7, aarch64, x86_32_sse3, mips):
    return select({
        "@//tools/toolchain:linux_x86_32": x86_32,
        "@//tools/toolchain:cpu_linux_x86_64": x86_64,
        "@//tools/toolchain:cpu_linux_x86_64_gcc4": x86_64,
        "@//tools/toolchain:cpu_linux_x86_64_gcc4_cuda8": x86_64,
        "@//tools/toolchain:cpu_windows_x86_64_cuda": x86_64,
        "@//tools/toolchain:cpu_windows_x86_64": x86_64,
        "@//tools/toolchain:cpu_windows_x86_32": x86_32,
        "@//tools/toolchain:cpu_tk1": armv7,
        "@//tools/toolchain:cpu_c3s": armv7,
        "@//tools/toolchain:cpu_potato": mips,
        "@//tools/toolchain:cpu_tx1": aarch64,
        "@//tools/toolchain:android_armv7": armv7,
        "@//tools/toolchain:android_aarch64": aarch64,
        "@//tools/toolchain:android_x86_32": x86_32,
        "@//tools/toolchain:android_x86_32_sse3": x86_32_sse3,
        "@//tools/toolchain:ios_armv7": armv7,
        "@//tools/toolchain:ios_aarch64": aarch64,
        })

###################### Operating system checks
def if_mobile(a):
    return mobile_select(a, [])

def if_not_mobile(a):
    return mobile_select([], a)

def mobile_select(a, b):
    return os_select(b, a, a, b)

def if_linux(a):
    return linux_select(a, [])

def if_not_linux(a):
    return linux_select([], a)

def linux_select(a, b):
    return os_select(a, b, b, b)

def if_android(a):
    return android_select(a, [])

def if_not_android(a):
    return android_select([], a)

def android_select(a, b):
    return os_select(b, a, b, b)

def if_ios(a):
    return ios_select(a, [])

def if_not_ios(a):
    return ios_select([], a)

def ios_select(a, b):
    return os_select(b, b, a, b)

def if_windows(a):
    return windows_select(a, [])

def if_not_windows(a):
    return windows_select([], a)

def windows_select(a, b):
    return os_select(b, b, b, a)

def os_select(linux, android, ios, windows):
    return select({
        "@//tools/toolchain:linux_x86_32": linux,
        "@//tools/toolchain:cpu_linux_x86_64": linux,
        "@//tools/toolchain:cpu_linux_x86_64_gcc4": linux,
        "@//tools/toolchain:cpu_linux_x86_64_gcc4_cuda8": linux,
        "@//tools/toolchain:cpu_tk1": linux,
        "@//tools/toolchain:cpu_c3s": linux,
        "@//tools/toolchain:cpu_potato": linux,
        "@//tools/toolchain:cpu_tx1": linux,
        "@//tools/toolchain:android_armv7": android,
        "@//tools/toolchain:android_aarch64": android,
        "@//tools/toolchain:android_x86_32": android,
        "@//tools/toolchain:android_x86_32_sse3": android,
        "@//tools/toolchain:ios_armv7": ios,
        "@//tools/toolchain:ios_aarch64": ios,
        "@//tools/toolchain:cpu_windows_x86_64_cuda": windows,
        "@//tools/toolchain:cpu_windows_x86_64": windows,
        "@//tools/toolchain:cpu_windows_x86_32": windows,
        })

###################### Other toolchain checks
def if_cuda(a):
    return cuda_select(a, [])

def if_not_cuda(a):
    return cuda_select([], a)

def cuda_select(a, b):
    return select({
        "@//tools/toolchain:compiler_gcc_cuda": a,
        "@//tools/toolchain:compiler_xclang_cuda": a,
        "@//conditions:default": b,
        })

def if_cuda_with_fp16(a):
    return cuda_with_fp16_select(a, [])

def if_not_cuda_with_fp16(a):
    return cuda_with_fp16_select([], a)

def cuda_with_fp16_select(a, b):
    return select({
        "@//tools/toolchain:tx1_gcc_cuda": a,
        "@//tools/toolchain:linux_x86_64_gcc4_cuda7": a,
        "@//tools/toolchain:linux_x86_64_gcc4_cuda8": a,
        "@//tools/toolchain:linux_x86_64_gcc5_cuda8": a,
        "@//tools/toolchain:windows_x86_64_xclang_cuda8": a,
        "@//conditions:default": b,
        })

def if_wibu_enabled(a):
    return wibu_enabled_select(a, [])

def if_not_wibu_enabled(a):
    return wibu_enabled_select([], a)

def wibu_enabled_select(a, b):
    return select({
        "@//tools/toolchain:linux_x86_32": a,
        "@//tools/toolchain:cpu_linux_x86_64": a,
        "@//tools/toolchain:cpu_linux_x86_64_gcc4": a,
        "@//tools/toolchain:cpu_linux_x86_64_gcc4_cuda8": a,
        "@//conditions:default": b,
        })

###################### Optimization level checks
def if_fastbuild(a):
    return compilation_mode_select(a, [], [])

def if_not_fastbuild(a):
    return compilation_mode_select([], a, a)

def if_dbg(a):
    return compilation_mode_select([], a, [])

def if_not_dbg(a):
    return compilation_mode_select(a, [], a)

def if_opt(a):
    return compilation_mode_select([], [], a)

def if_not_opt(a):
    return compilation_mode_select(a, a, [])

def fastbuild_select(a, b):
    return compilation_mode_select(a, b, b)

def dbg_select(a, b):
    return compilation_mode_select(b, a, b)

def opt_select(a, b):
    return compilation_mode_select(b, b, a)

def compilation_mode_select(fastbuild, dbg, opt):
    return select({
        "@//tools/toolchain:fastbuild": fastbuild,
        "@//tools/toolchain:dbg": dbg,
        "@//tools/toolchain:opt": opt,
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
