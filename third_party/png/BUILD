licenses(["restricted"])  # MPL2, portions GPL v3, LGPL v3, BSD-like
package(default_visibility = ["//visibility:public"])

cc_library(
    name = "config",
    hdrs = ["config.h"],
    )

cc_library(
    name = "pnglibconf",
    hdrs = ["pnglibconf/pnglibconf.h"],
    includes = ["pnglibconf"],
    )

pnglibconf_gen_cmd_template = "sed 's/{{PNG_ZLIB_VERNUM}}/%s/g' $(location pnglibconf.h.template) > $(@D)/pnglibconf.h"

genrule(
    name = "gen-pnglibconf",
    srcs = [
        "pnglibconf.h.template",
        ],
    outs = [
        "pnglibconf/pnglibconf.h",
        ],
    cmd = android_select(
        pnglibconf_gen_cmd_template % "0x1230",
        pnglibconf_gen_cmd_template % "0x12B0",
        ),
    )
