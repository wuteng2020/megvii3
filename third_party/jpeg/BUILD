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

jconfigint_template = "sed 's/{{SIZE}}/%s/g' $(location jconfigint.h.template) > $(@D)/jconfigint.h"

genrule(
    name = "gen-jconfigint",
    srcs = ["jconfigint.h.template"],
    outs = ["jconfigint.h"],
    cmd = wordsize_select(
        jconfigint_template % "32",
        jconfigint_template % "64",
        ),
    )

filegroup(
    name = "jsimdcfg",
    srcs = ["jsimdcfg.inc"],
    )
