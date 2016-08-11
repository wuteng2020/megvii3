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

cc_megvii_shared_object = rule(
    implementation = _cc_megvii_shared_object_impl,
    attrs = {
        "deps": attr.label_list(),
        "syms": attr.string_list(),
        # FIXME(yangyi) Should depend on a virtual toolchain instead
        # https://github.com/bazelbuild/bazel/issues/1624
        # Upstream: reported, accepted but not fixed for now.
        "_toolchain": attr.label(default = Label("//tools/toolchain/v3:toolchain")),
        },
    outputs = {
        "out": "%{name}.so",
        },
    fragments = [
        "cpp",
        ],
)
