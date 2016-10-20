# vim: set ft=python

# Auxillary aspect to help finding out direct headers of cc_library's.
def _megvii_direct_headers_aspect(target, ctx):
    hdrs = [f for hdrs in ctx.rule.attr.hdrs for f in hdrs.files]

    return struct(
        megvii_lib = struct(
            direct_headers = hdrs,
            )
        )

megvii_direct_headers_aspect = aspect(
    implementation = _megvii_direct_headers_aspect,
)

def filter_shared_object_flags(flags):
    return [x for x in flags if x!="-pie" and x!="-Wl,-pie"]

def _cc_megvii_shared_object_impl(ctx):
    deps = ctx.attr.deps
    excludes = ctx.attr.excludes
    syms = ctx.attr.syms
    toolchain_files = ctx.attr._toolchain.files

    output = ctx.outputs.out
    output_unstripped = ctx.outputs.out_unstripped

    os = list(ctx.attr._os.files)[0].short_path.split("/")[-1]

    libs = set([])
    exclude_libs = set([])
    ldflags = []
    whole_archive_libs = set([])
    other_libs = set([])

    for x in excludes:
        for f in x.files:
            exclude_libs = exclude_libs | [f]

    for x in deps:
        libs = libs | x.cc.libs
        ldflags = ldflags + x.cc.link_flags

        for y in x.files:
            if not y in exclude_libs and (y.path.endswith(".lo") or y.path.endswith(".a")):
                whole_archive_libs = whole_archive_libs | [y]

    for x in libs:
        if not x in whole_archive_libs and not x in exclude_libs:
            # If some indirectly included library has alwayslink = 1, we whole-archive it.
            if x.path.endswith(".lo"):
                whole_archive_libs = whole_archive_libs | [x]
            else:
                other_libs = other_libs | [x]

    gcc_command = ctx.fragments.cpp.compiler_executable
    strip_command = ctx.fragments.cpp.strip_executable

    if os == "ios":
        whole_archive_snippet = [
            "-Wl,-force_load,"+x.path for x in whole_archive_libs] +[
            x.path for x in whole_archive_libs]
        other_libs_snippet = [x.path for x in other_libs]
        strip_options = ["-u", "-S", "-x"]
        linker_flags = filter_shared_object_flags(ldflags + ctx.fragments.cpp.mostly_static_link_options([], False))

        version_script_files = []
        version_script_snippet = []
    else:
        whole_archive_snippet = [
            "-Wl,--whole-archive",
            ] + [x.path for x in whole_archive_libs] + [
            "-Wl,--no-whole-archive",
            ]
        other_libs_snippet = [
            "-Wl,--start-group",
            ] + [x.path for x in other_libs] + [
            "-Wl,--end-group",
            ]
        strip_options = []
        linker_flags = filter_shared_object_flags(ldflags + ctx.fragments.cpp.mostly_static_link_options([], False)) + [
            "-Wl,--exclude-libs=" + x.path.split("/")[-1] for x in other_libs
            ] +\
            ["-Wl,-soname="+output.path.split("/")[-1]]

        if syms == []:
            ldscript = ctx.new_file(output.path + ".ldscript")
            ctx.file_action(
                output = ldscript,
                content = "{};\n"
                )
        else:
            ldscript = ctx.new_file(output.path + ".ldscript")
            ctx.file_action(
                output = ldscript,
                content = "{\nglobal:\n" + "".join(["    " + x + ";\n" for x in syms]) + "    local: *;\n};\n"
                )

        version_script_files = [ldscript]
        version_script_snippet = ["-Wl,--version-script=%s" % ldscript.path]

    ctx.action(
        inputs=list(toolchain_files) + list(whole_archive_libs | other_libs) + version_script_files,
        outputs=[output_unstripped],
        progress_message="Linking %s..." % output_unstripped.path,
        executable = gcc_command,
        arguments = whole_archive_snippet + other_libs_snippet + linker_flags + [
            "-shared", "-o", output_unstripped.path] + version_script_snippet
        )
    ctx.action(
        inputs=[output_unstripped] + list(toolchain_files),
        outputs=[output],
        progress_message="Stripping %s..." % output.path,
        executable = strip_command,
        arguments = [output_unstripped.path] + strip_options + ["-o", output.path]
        )

    # Pack the headers
    build_tar = ctx.executable._build_tar
    header_tar = ctx.outputs.header_tar

    headers = [f for d in deps for f in d.megvii_lib.direct_headers]
    args = [
        "--output=" + header_tar.path,
        "--directory=",
        "--mode=0644",
    ]
    args += ["--file=%s=%s" % (f.path, "include/"+f.path.split("/")[-1]) for f in headers]

    arg_file = ctx.new_file(ctx.label.name + "_headers.args")
    ctx.file_action(arg_file, "\n".join(args))

    ctx.action(
        executable = build_tar,
        arguments = ["--flagfile=" + arg_file.path],
        inputs = [arg_file] + headers,
        outputs = [header_tar],
        mnemonic="PackageTar"
        )

    return struct(
        cc = struct(
            libs = [output],
            static_libs = whole_archive_libs + other_libs,
            header_tar = [header_tar],
            changelogs = ctx.files.changelogs,
            )
        )

# Build a shared object, helper function
# deps: list of dependent cc_library's. We want their headers and interface.
# excludes: list of cc_library's that might be contained by deps but we want to explicitly exclude.
# syms: list of symbols we want to keep. Can use glob. No effect when empty, in which case we rely on regular stripping after -Wl,--exclude-libs.
# changelog: list of text files to use to build the CHANGELOG file when packing.
_cc_megvii_shared_object = rule(
    implementation = _cc_megvii_shared_object_impl,
    attrs = {
        "deps": attr.label_list(aspects = [megvii_direct_headers_aspect]),
        "syms": attr.string_list(),
        "excludes": attr.label_list(),
        "changelogs": attr.label_list(allow_files = True),
        "_toolchain": attr.label(default = Label("//tools/toolchain/v3:toolchain_files")),
        "_build_tar": attr.label(
            default=Label("@bazel_tools//tools/build_defs/pkg:build_tar"),
            cfg=HOST_CFG,
            executable=True,
            allow_files=True),
        "_os": attr.label(default = Label("//tools/toolchain/workaround:os_select")),
        },
    outputs = {
        "out": "lib%{name}.so",
        "out_unstripped": "lib%{name}.so.unstripped",
        "header_tar": "%{name}_headers.tar",
        },
    fragments = [
        "cpp",
        ],
)

# Provides extra options for cc_megvii_shared_object:
#
# srcs: list of extra source file
# hdrs: list of extra header file
# copts: list of copt for building with srcs
# internal_deps: dependencies that's only used by srcs
# defines, includes, linkopts, nocopts: same as cc_library
#
# This wrapper achieves this by creating a private cc_library and depends on it.
def cc_megvii_shared_object(name,
        deps = [],
        syms = [],
        excludes = [],
        changelogs = [],
        srcs = [],
        hdrs = [],
        copts = [],
        includes = None,
        nocopts = None,
        internal_deps = [],
        licenses = None,
        linkopts = None,
        defines = None,
        visibility = None):
    internal_cc_library_name = name + ".internal_cc_library"
    native.cc_library(
        name = internal_cc_library_name,
        deps = internal_deps,
        srcs = srcs,
        hdrs = hdrs,
        copts = copts,
        defines = defines,
        includes = includes,
        linkopts = linkopts,
        nocopts = nocopts,
        )
    _cc_megvii_shared_object(
        name = name,
        deps = deps + [
            internal_cc_library_name,
            ],
        syms = syms,
        excludes = excludes,
        changelogs = changelogs,
        visibility = visibility,
        )

def _cc_megvii_binary_impl(ctx):
    deps = ctx.attr.deps
    toolchain_files = ctx.attr._toolchain.files

    output = ctx.outputs.executable
    output_unstripped = ctx.outputs.out_unstripped

    os = list(ctx.attr._os.files)[0].short_path.split("/")[-1]

    libs = set([])
    ldflags = []
    runfiles = ctx.files.data
    for x in [d.cc for d in deps]:
        if "link_flags" in dir(x):
            # a cc_library
            libs = libs | [p for p in x.libs]
            ldflags = ldflags + [p for p in x.link_flags]
        else:
            # a megvii_shared_object
            libs = libs | [p for p in x.libs]
        runfiles = runfiles + [p for p in x.libs]

    whole_archive_libs = set([])
    other_libs = set([])
    shared_libs = set([])

    for x in deps:
        for y in x.files:
            if y.path.endswith(".lo") or y.path.endswith(".a"):
                whole_archive_libs = whole_archive_libs | [y]
    for x in libs:
        if not x in whole_archive_libs:
            # If some indirectly included library has alwayslink = 1, we whole-archive it.
            if x.path.endswith(".lo"):
                whole_archive_libs = whole_archive_libs | [x]
            elif x.path.endswith(".so"):
                shared_libs = shared_libs | [x]
            else:
                other_libs = other_libs | [x]

    gcc_command = ctx.fragments.cpp.compiler_executable
    strip_command = ctx.fragments.cpp.strip_executable
    linker_flags = ldflags + ctx.fragments.cpp.mostly_static_link_options([], False)

    if os == "ios":
        whole_archive_snippet = [
            "-Wl,-force_load,"+x.path for x in whole_archive_libs] + [
            x.path for x in whole_archive_libs]
        other_libs_snippet = [x.path for x in other_libs]
        strip_options = ["-u", "-S", "-x"]
        rpath_snippet = []
    else:
        whole_archive_snippet = ["-Wl,--whole-archive"] + [x.path for x in whole_archive_libs] + ["-Wl,--no-whole-archive"]
        other_libs_snippet = ["-Wl,--start-group"] + [x.path for x in other_libs] + ["-Wl,--end-group"]
        strip_options = ["-s"]
        rpath_snippet = ["-Wl,--rpath="+"/".join(x.short_path.split("/")[:-1]) for x in shared_libs]

    shared_libs_snippet = ["-L"+"/".join(x.path.split("/")[:-1]) for x in shared_libs] +\
            ["-l"+x.path.split("/")[-1][3:-3] for x in shared_libs]

    ctx.action(
        inputs=list(toolchain_files) + list(whole_archive_libs | other_libs | shared_libs),
        outputs=[output_unstripped],
        progress_message="Linking %s..." % output_unstripped.path,
        executable = gcc_command,
        arguments = whole_archive_snippet + other_libs_snippet + rpath_snippet + shared_libs_snippet +\
            linker_flags + ["-o", output_unstripped.path]
        )
    ctx.action(
        inputs=[output_unstripped] + list(toolchain_files),
        outputs=[output],
        progress_message="Stripping %s..." % output.path,
        executable = strip_command,
        arguments = [output_unstripped.path] + strip_options + ["-o", output.path]
        )

    return struct(
        runfiles = ctx.runfiles(
            files = runfiles,
            ),
        files = set([output]),
        )

_cc_megvii_test = rule(
    implementation = _cc_megvii_binary_impl,
    attrs = {
        "deps": attr.label_list(),
        "data": attr.label_list(allow_files = True),
        "_toolchain": attr.label(default = Label("//tools/toolchain/v3:toolchain_files")),
        "_os": attr.label(default = Label("//tools/toolchain/workaround:os_select")),
        },
    fragments = [
        "cpp",
        ],
    outputs = {
        "out_unstripped": "%{name}.unstripped",
        },
    test = True,
)

_cc_megvii_binary = rule(
    implementation = _cc_megvii_binary_impl,
    attrs = {
        "deps": attr.label_list(),
        "data": attr.label_list(allow_files = True),
        "_toolchain": attr.label(default = Label("//tools/toolchain/v3:toolchain_files")),
        "_os": attr.label(default = Label("//tools/toolchain/workaround:os_select")),
        },
    fragments = [
        "cpp",
        ],
    outputs = {
        "out_unstripped": "%{name}.unstripped",
        },
    executable = True,
)

# Provides extra options for cc_megvii_binary/test:
#
# srcs: list of extra source file
# copts: list of copt for building with srcs
# internal_deps: dependencies that's only used by srcs
# linkopts, nocopts: same as cc_library
#
# This wrapper achieves this by creating a private cc_library and depends on it.
def cc_megvii_test(name,
        deps = [],
        srcs = [],
        copts = [],
        nocopts = None,
        internal_deps = [],
        licenses = None,
        internal_linkopts = None,
        visibility = None,
        size = None,
        flaky = None,
        args = [],
        data = []):
    internal_cc_library_name = name + ".internal_cc_library"
    native.cc_library(
        name = internal_cc_library_name,
        deps = internal_deps,
        srcs = srcs,
        copts = copts,
        linkopts = internal_linkopts,
        nocopts = nocopts,
        )
    _cc_megvii_test(
        name = name,
        deps = deps + [
            internal_cc_library_name,
            ],
        visibility = visibility,
        size = size,
        flaky = flaky,
        args = args,
        data = data,
        )

def cc_megvii_binary(name,
        deps = [],
        srcs = [],
        copts = [],
        nocopts = None,
        internal_deps = [],
        licenses = None,
        internal_linkopts = None,
        visibility = None,
        args = [],
        data = None):
    internal_cc_library_name = name + ".internal_cc_library"
    native.cc_library(
        name = internal_cc_library_name,
        deps = internal_deps,
        srcs = srcs,
        copts = copts,
        linkopts = internal_linkopts,
        nocopts = nocopts,
        )
    _cc_megvii_binary(
        name = name,
        deps = deps + [
            internal_cc_library_name,
            ],
        visibility = visibility,
        args = args,
        data = data,
        )

