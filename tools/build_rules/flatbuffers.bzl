def flatbuffers_cc_library(name,
        srcs = [],
        prefix = "",
        set_bazel_includes = True,
        no_includes = False,
        gen_mutable = False,
        gen_object_api = False,
        gen_name_strings = False,
        licenses = None,
        visibility = None):
    prefix = "flatbuffers/" + prefix
    if not prefix.endswith("/"):
        fail("flatbuffers_cc_library: prefix should end with \"/\"!")
    hdrs = []
    for src in srcs:
        if not src.endswith(".fbs"):
            fail("flatbuffers_cc_library: elements in srcs should end with \".fbs\"!")
        header_name = prefix + src.split("/")[-1][:-4] + "_generated.h"
        hdrs = hdrs + [header_name]
    native.genrule(
        name = name + "-flatbuffer-gen",
        srcs = srcs,
        tools = ["@flatbuffers_archive//:flatc"],
        outs = hdrs,
        cmd = "hdr_example=$(location %s); $(location @flatbuffers_archive//:flatc) --cpp%s%s%s%s -o $${hdr_example%%/*} %s; touch %s" % (
            hdrs[0],
            " --no-includes" if no_includes else "",
            " --gen-mutable" if gen_mutable else "",
            " --gen-object-api" if gen_object_api else "",
            " --gen-name-strings" if gen_name_strings else "",
            " ".join(["$(location %s)" % src for src in srcs]),
            " ".join(["$(location %s)" % hdr for hdr in hdrs]),
            )
        )
    native.cc_library(
        name = name,
        hdrs = hdrs,
        deps = ["@flatbuffers_archive//:flatbuffers_header"],
        includes = ["flatbuffers/"] if set_bazel_includes else [],
        licenses = licenses,
        visibility = visibility,
        )
