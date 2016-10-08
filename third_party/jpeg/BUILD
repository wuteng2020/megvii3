licenses(["restricted"])  # MPL2, portions GPL v3, LGPL v3, BSD-like
package(default_visibility = ["//visibility:public"])

cc_library(
    name = "jconfig",
    hdrs = ["jconfig.h"],
    includes = ["."],
    )

cc_library(
    name = "jconfigint",
    hdrs = if_wordsize_32(["32/jconfigint.h"]) + if_wordsize_64(["64/jconfigint.h"]),
    includes = if_wordsize_32(["32"]) + if_wordsize_64(["64"]),
    )

genrule(
    name = "jconfigint-32",
    srcs = ["jconfigint.h"],
    outs = ["32/jconfigint.h"],
    cmd = "sed 's/{{SIZE}}/32/g' $(location jconfigint.h) > $(@D)/jconfigint.h",
    )

genrule(
    name = "jconfigint-64",
    srcs = ["jconfigint.h"],
    outs = ["64/jconfigint.h"],
    cmd = "sed 's/{{SIZE}}/64/g' $(location jconfigint.h) > $(@D)/jconfigint.h",
    )

filegroup(
    name = "jsimdcfg",
    srcs = ["jsimdcfg.inc"],
    )
