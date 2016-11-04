licenses(["restricted"])  # MPL2, portions GPL v3, LGPL v3, BSD-like
package(default_visibility = ["//visibility:public"])

cc_library(
    name = "config",
    hdrs = ["config.h"],
    )

config_template = "sed 's/{{SIZE}}/%s/g' $(location config.h.template) > $(@D)/config.h"

genrule(
    name = "gen-config",
    srcs = ["config.h.template"],
    outs = ["config.h"],
    cmd = wordsize_select(
        config_template % "32",
        config_template % "64",
        ),
    )
