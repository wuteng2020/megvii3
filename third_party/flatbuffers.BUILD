cc_library(
    name = "flatbuffers_lib",
    srcs = [
        "include/flatbuffers/code_generators.h",
        "include/flatbuffers/hash.h",
        "include/flatbuffers/idl.h",
        "include/flatbuffers/util.h",
        "include/flatbuffers/reflection.h",
        "include/flatbuffers/reflection_generated.h",
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
    srcs = [
        "src/idl_gen_cpp.cpp",
        "src/idl_gen_general.cpp",
        "src/idl_gen_go.cpp",
        "src/idl_gen_js.cpp",
        "src/idl_gen_php.cpp",
        "src/idl_gen_python.cpp",
        "src/idl_gen_fbs.cpp",
        "src/idl_gen_grpc.cpp",
        "src/flatc.cpp",
        "grpc/src/compiler/cpp_generator.h",
        "grpc/src/compiler/cpp_generator.cc",
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

cc_megvii_test(
    name = "flattests",
    srcs = [
        "src/idl_gen_general.cpp",
        "src/idl_gen_fbs.cpp",
        "tests/test.cpp",
        ],
    internal_deps = [
        ":flatbuffers_lib",
        ":monster_test",
        ":namespace_test",
        ],
    copts = [
        "-fsigned-char",
        "-Iexternal/flatbuffers_archive/include",
        ],
    )
