load("//tools/build_rules:megvii.bzl", "rule_cc_megvii_shared_object_prefixless")
load("@//tools/toolchain:toolchain.bzl", "if_linux")

def cc_megvii_pybind11_shared_object(name,
        deps = [],
        excludes = [],
        changelogs = [],
        srcs = [],
        hdrs = [],
        copts = [],
        includes = None,
        nocopts = None,
        licenses = None,
        linkopts = None,
        defines = None,
        visibility = None,
        python_versions = ["py35m"]):
    [native.cc_library(
        name = "%s.%s.internal_cc_library" % (name, python_version),
        deps = if_linux(deps + [
                "//external:pybind11_%s" % python_version,
                ]),
        srcs = if_linux(srcs),
        hdrs = hdrs,
        copts = copts,
        defines = defines,
        includes = includes,
        linkopts = linkopts,
        nocopts = nocopts,
        ) for python_version in python_versions]
    [rule_cc_megvii_shared_object_prefixless(
        name = "%s.%s" % (name, python_version),
        deps = ["%s.%s.internal_cc_library" % (name, python_version)],
        syms = [
                "PyInit_%s" % name,
                ],
        excludes = excludes,
        changelogs = changelogs,
        visibility = visibility,
        ) for python_version in python_versions]
