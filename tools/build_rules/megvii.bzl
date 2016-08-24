# vim: set ft=python

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

def _cc_megvii_shared_object_impl(ctx):
    deps = ctx.attr.deps
    syms = ctx.attr.syms
    toolchain_files = ctx.attr._toolchain.files

    output = ctx.outputs.out
    output_unstripped = ctx.new_file(output.path + ".unstripped")

    libs = set([])
    ldflags = []
    for x in [d.cc for d in deps]:
        libs = libs | [p for p in x.pic_libs]
        ldflags = ldflags + [p for p in x.link_flags]

    whole_archive_libs = set([])
    other_libs = set([])

    for x in deps:
        # Always use *.pic.lo or *.pic.a
        for y in x.files:
            if y.path.endswith(".pic.lo") or y.path.endswith(".pic.a"):
                whole_archive_libs = whole_archive_libs | [y]
    for x in libs:
        if not x in whole_archive_libs:
            # If some indirectly included library has alwayslink = 1, we whole-archive it.
            if x.path.endswith(".lo"):
                whole_archive_libs = whole_archive_libs | [x]
            else:
                other_libs = other_libs | [x]

    gcc_command = ctx.fragments.cpp.compiler_executable
    strip_command = ctx.fragments.cpp.strip_executable
    linker_flags = " ".join(ldflags + ctx.fragments.cpp.mostly_static_link_options([], False)) + " -Wl,--exclude-libs=" + " -Wl,--exclude-libs=".join([x.path.split("/")[-1] for x in other_libs])

    if syms == []:
        ctx.action(
            inputs=list(toolchain_files) + list(whole_archive_libs | other_libs),
            outputs=[output_unstripped],
            progress_message="Linking Megvii shared object...",
            command="%s -Wl,--whole-archive %s -Wl,--no-whole-archive -Wl,--start-group %s -Wl,--end-group %s -shared -o %s" % (
                gcc_command,
                " ".join([x.path for x in whole_archive_libs]),
                " ".join([x.path for x in other_libs]),
                linker_flags,
                output_unstripped.path)
            )
    else:
        ldscript = ctx.new_file(output.path + ".ldscript")
        ctx.file_action(
            output = ldscript,
            content = "{\nglobal:\n" + "".join(["    " + x + ";\n" for x in syms]) + "    local: *;\n};\n"
            )

        ctx.action(
            inputs=list(toolchain_files) + list(whole_archive_libs | other_libs) + [ldscript],
            outputs=[output_unstripped],
            progress_message="Linking Megvii shared object...",
            command="%s -Wl,--whole-archive %s -Wl,--no-whole-archive -Wl,--start-group %s -Wl,--end-group %s -shared -o %s -Wl,--version-script=%s" % (
                gcc_command,
                " ".join([x.path for x in whole_archive_libs]),
                " ".join([x.path for x in other_libs]),
                linker_flags,
                output_unstripped.path,
                ldscript.path)
            )
    ctx.action(
        inputs=[output_unstripped] + list(toolchain_files),
        outputs=[output],
        progress_message="Stripping Megvii shared object...",
        command="%s %s -o %s" % (strip_command, output_unstripped.path, output.path)
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
            header_tar = [header_tar],
            )
        )

cc_megvii_shared_object = rule(
    implementation = _cc_megvii_shared_object_impl,
    attrs = {
        "deps": attr.label_list(aspects = [megvii_direct_headers_aspect]),
        "syms": attr.string_list(),
        # FIXME(yangyi) Should depend on a virtual toolchain instead
        # https://github.com/bazelbuild/bazel/issues/1624
        # Upstream: reported, accepted but not fixed for now.
        "_toolchain": attr.label(default = Label("//tools/toolchain/v3:toolchain")),
        "_build_tar": attr.label(
            default=Label("@bazel_tools//tools/build_defs/pkg:build_tar"),
            cfg=HOST_CFG,
            executable=True,
            allow_files=True)
        },
    outputs = {
        "out": "lib%{name}.so",
        "header_tar": "%{name}_headers.tar",
        },
    fragments = [
        "cpp",
        ],
)

def _cc_megvii_test_impl(ctx):
    deps = ctx.attr.deps
    toolchain_files = ctx.attr._toolchain.files

    output = ctx.outputs.out
    output_unstripped = ctx.new_file(output.path + ".unstripped")

    libs = set([])
    ldflags = []
    runfiles = []
    for x in [d.cc for d in deps]:
        if "pic_libs" in dir(x):
            # a cc_library
            libs = libs | [p for p in x.pic_libs]
            ldflags = ldflags + [p for p in x.link_flags]
        else:
            # a megvii_shared_object
            libs = libs | [p for p in x.libs]
            runfiles = runfiles + [p for p in x.libs]

    whole_archive_libs = set([])
    other_libs = set([])
    shared_libs = set([])

    for x in deps:
        # Always use *.pic.lo or *.pic.a
        for y in x.files:
            if y.path.endswith(".pic.lo") or y.path.endswith(".pic.a"):
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
    linker_flags = " ".join(ldflags + ctx.fragments.cpp.mostly_static_link_options([], False))

    ctx.action(
        inputs=list(toolchain_files) + list(whole_archive_libs | other_libs | shared_libs),
        outputs=[output_unstripped],
        progress_message="Linking Megvii test...",
        command="%s -Wl,--whole-archive %s -Wl,--no-whole-archive -Wl,--start-group %s -Wl,--end-group %s %s %s %s -o %s" % (
            gcc_command,
            " ".join([x.path for x in whole_archive_libs]),
            " ".join([x.path for x in other_libs]),
            " ".join(["-Wl,--rpath="+"/".join(x.short_path.split("/")[:-1]) for x in shared_libs]),
            " ".join(["-L"+"/".join(x.path.split("/")[:-1]) for x in shared_libs]),
            " ".join(["-l"+x.path.split("/")[-1][3:-3] for x in shared_libs]),
            linker_flags,
            output_unstripped.path)
        )
    ctx.action(
        inputs=[output_unstripped] + list(toolchain_files),
        outputs=[output],
        progress_message="Stripping Megvii test...",
        command="%s %s -s -o %s" % (strip_command, output_unstripped.path, output.path)
        )

    return struct(
        runfiles = ctx.runfiles(
            files = runfiles,
            )
        )

cc_megvii_test = rule(
    implementation = _cc_megvii_test_impl,
    attrs = {
        "deps": attr.label_list(),
        # FIXME(yangyi) Should depend on a virtual toolchain instead
        # https://github.com/bazelbuild/bazel/issues/1624
        # Upstream: reported, accepted but not fixed for now.
        "_toolchain": attr.label(default = Label("//tools/toolchain/v3:toolchain")),
        },
    outputs = {
        "out": "%{name}",
        },
    fragments = [
        "cpp",
        ],
    test = True,
)
