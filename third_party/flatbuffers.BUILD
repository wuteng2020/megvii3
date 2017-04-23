cc_library(
    name = "flatbuffers_lib",
    srcs = glob([
        "include/flatbuffers/*.h",
        ]) + [
        "src/idl_parser.cpp",
        "src/idl_gen_text.cpp",
        "src/reflection.cpp",
        "src/util.cpp",
        ],
    includes = [
        "include",
        ],
    deps = [
        ":flatbuffers_header",
        ],
    )

cc_library(
    name = "flatbuffers_header",
    srcs = [
        "include/flatbuffers/flatbuffers.h",
        ],
    includes = [
        "include",
        ],
    visibility = [
        "//visibility:public",
        ],
    )

cc_megvii_binary(
    name = "flatc",
    srcs = glob([
        "grpc/src/compiler/*.h",
        "grpc/src/compiler/*.cc",
        ]) + [
        "src/idl_gen_cpp.cpp",
        "src/idl_gen_general.cpp",
        "src/idl_gen_go.cpp",
        "src/idl_gen_js.cpp",
        "src/idl_gen_php.cpp",
        "src/idl_gen_python.cpp",
        "src/idl_gen_fbs.cpp",
        "src/idl_gen_grpc.cpp",
        "src/code_generators.cpp",
        "src/flatc.cpp",
        "src/flatc_main.cpp",
        ],
    internal_deps = [
        ":flatbuffers_lib",
        ],
    copts = [
        "-fsigned-char",
        "-Iexternal/flatbuffers_archive/include",
        "-Iexternal/flatbuffers_archive/grpc",
        ],
    visibility = [
        "//visibility:public",
        ],
    )

cc_megvii_binary(
    name = "flathash",
    srcs = [
        "src/flathash.cpp",
        "include/flatbuffers/hash.h",
        ],
    internal_deps = [
        ":flatbuffers_header",
        ],
    copts = [
        "-fsigned-char",
        "-Iexternal/flatbuffers_archive/include",
        ],
    visibility = [
        "//visibility:public",
        ],
    )

flatbuffers_cc_library(
    name = "monster_test",
    srcs = [
        "tests/monster_test.fbs",
        "tests/include_test1.fbs",
        "tests/include_test2.fbs",
        ],
    no_includes = True,
    gen_mutable = True,
    gen_object_api = True,
    )

flatbuffers_cc_library(
    name = "namespace_test",
    srcs = glob([
        "tests/namespace_test/*.fbs",
        ]),
    prefix = "namespace_test/",
    no_includes = True,
    gen_mutable = True,
    gen_object_api = True,
    )

genrule(
    name = "flattests-replace-path",
    srcs = [
        "tests/test.cpp",
        ],
    outs = [
        "tests/test-patched.cpp",
        ],
    cmd = "sed -e 's=\"tests=\"external/flatbuffers_archive/tests=g' $(location tests/test.cpp) > $(@D)/test-patched.cpp"
    )

cc_megvii_test(
    name = "flattests",
    srcs = [
        "src/code_generators.cpp",
        "src/idl_gen_fbs.cpp",
        "src/idl_gen_general.cpp",
        ":flattests-replace-path",
        ] + glob([
        "tests/**/*.h",
        ]),
    internal_deps = [
        ":flatbuffers_lib",
        ":monster_test",
        ":namespace_test",
        ],
    copts = [
        "-fsigned-char",
        "-DFLATBUFFERS_TRACK_VERIFIER_BUFFER_SIZE",
        "-Iexternal/flatbuffers_archive/include",
        "-Iexternal/flatbuffers_archive/tests",
        ],
    data = glob([
        "tests/**",
        ]),
    size = "small",
    )
