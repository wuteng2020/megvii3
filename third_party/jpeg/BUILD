licenses(["restricted"])  # MPL2, portions GPL v3, LGPL v3, BSD-like
package(default_visibility = ["//visibility:public"])

cc_library(
    name = "jconfig",
    hdrs = ["jconfig.h"],
    includes = ["."],
    )

cc_library(
    name = "jconfigint",
    hdrs = ["jconfigint.h"],
    includes = ["."],
    )

filegroup(
    name = "jsimdcfg",
    srcs = ["jsimdcfg.inc"],
    )
