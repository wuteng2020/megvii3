# load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

def _pkg_mapsv2_impl(ctx):
    deps = ctx.attr.deps
    hdrs = ctx.files.extra_hdrs
    tests = ctx.files.tests
    docs = ctx.files.docs
    data = ctx.files.data

    build_tar = ctx.executable._build_tar
    
    output = ctx.outputs.out

    f_null = ctx.new_file(output.path + ".parts/NULL")
    f_changelog = ctx.new_file(output.path + ".parts/CHANGELOG")
    f_version = ctx.new_file(output.path + ".parts/VERSION")

    ctx.file_action(
        output = f_null,
        content = "",
        )

    ctx.file_action(
        output = f_changelog,
        # FIXME(yangyi)
        # Support Changelogs
        content = "",
        )
    
    ctx.file_action(
        output = f_version,
        content = "BUILT BY BAZEL",
        )
    
    args = [ 
        "--output=" + output.path,
        "--directory=",
        "--mode=0644",
    ]
    args += ["--file=%s=%s" % (f.path, "lib/" + f.short_path.split("/")[-1]) for d in deps for f in d.cc.libs]
    args += ["--modes=%s=0755" % ("lib/" + f.short_path.split("/")[-1]) for d in deps for f in d.cc.libs]
    args += ["--file=%s=%s" % (f.path, "include/" + f.short_path.split("/")[-1]) for f in hdrs]
    args += ["--tar=%s" % f.path for d in deps for f in d.cc.header_tar]
    args += ["--file=%s=%s" % (f.path, "doc/" + f.short_path.split("/")[-1]) for f in docs]
    args += ["--file=%s=%s" % (f.path, "bin/test/" + f.short_path.split("/")[-1]) for f in tests]
    args += ["--modes=%s=0755" % ("bin/test/" + f.short_path.split("/")[-1]) for f in tests]
    args += ["--file=%s=%s" % (f.path, "data/" + f.short_path.split("/")[-1]) for f in data]
    args += ["--file=%s=%s" % (f_changelog.path, "CHANGELOG")]
    args += ["--file=%s=%s" % (f_version.path, "VERSION")]

    args += [
        "--file=%s=lib/.keep_directory" % f_null.path,
        "--file=%s=include/.keep_directory" % f_null.path,
        "--file=%s=doc/.keep_directory" % f_null.path,
        "--file=%s=bin/.keep_directory" % f_null.path,
        ]

    arg_file = ctx.new_file(ctx.label.name + ".args")
    ctx.file_action(arg_file, "\n".join(args))

    ctx.action(
            executable = build_tar,
            arguments = ["--flagfile=" + arg_file.path],
            inputs = [f_null, f_changelog, f_version, arg_file] + ctx.files.deps + hdrs + docs + tests + data,
            outputs = [ctx.outputs.out],
            mnemonic="PackageTar"
            )

pkg_mapsv2 = rule(
    implementation = _pkg_mapsv2_impl,
    attrs = {
        "deps": attr.label_list(),
        "extra_hdrs": attr.label_list(),
        "tests": attr.label_list(),
        "data": attr.label_list(),
        "docs": attr.label_list(),
        "extra_changelogs": attr.label_list(),
        # Implicit rules
        "_build_tar": attr.label(
            default=Label("@bazel_tools//tools/build_defs/pkg:build_tar"),
            cfg=HOST_CFG,
            executable=True,
            allow_files=True)
        },
    outputs = {
        "out": "%{name}.tar",
        },
)
