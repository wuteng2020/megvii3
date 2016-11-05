def label_to_word(l):
    return list(l.files)[0].short_path.split("/")[-1]

def sanitize_static_library_path(p):
    return p.replace("..", "external").replace("_", "U_").replace("/", "S_")

def pkgconfig(target_name, libdir, libraries):
    return """prefix=@prefix@
exec_prefix=${prefix}
libdir=${prefix}/%s
includedir=${prefix}/include

Name: lib%s
Description: lib%s, built in megvii3
Version: 1.0.0
Requires:
Libs: %s
Libs.private: -Wl,--push-state,--as-needed,-lpthread,-lrt,-ldl,-lm,--pop-state
Cflags: -I${includedir}
""" % (libdir, target_name, target_name, " ".join(["${libdir}/" + l for l in libraries]))

def _pkg_mapsv2_impl(ctx):
    deps = ctx.attr.deps
    hdrs = ctx.files.extra_hdrs
    tests = ctx.files.tests
    docs = ctx.files.docs
    data = ctx.files.data

    build_tar = ctx.executable._build_tar
    
    output = ctx.outputs.out

    is_wibu_enabled = label_to_word(ctx.attr._is_wibu_enabled)
    os = label_to_word(ctx.attr._os)
    arch = label_to_word(ctx.attr._arch)
    cmode = label_to_word(ctx.attr._cmode)

    myname = output.short_path.split("/")[-1][:-4]

    if is_wibu_enabled == "is_wibu_enabled":
        lib_prefix = "lib/"
    else:
        lib_prefix = "lib/%s/" % arch

    f_changelog = ctx.new_file(output.path + ".parts/CHANGELOG")
    f_version = ctx.new_file(output.path + ".parts/VERSION")
    f_pkgconfig = ctx.new_file(output.path + ".parts/" + lib_prefix + "pkgconfig")
    
    changelogs = [f for d in deps for f in d.cc.changelogs]
    ctx.action(
        inputs = changelogs,
        outputs = [f_changelog],
        command = "cat %s > %s" % (" ".join([f.path for f in changelogs]), f_changelog.path)
        )
    
    ctx.file_action(
        output = f_version,
        content = "Built by Bazel in megvii3, with options:\n    OS: %s\n    Architecture: %s\n    Optimization: %s\n" % (os, arch, cmode),
        )

    ctx.file_action(
        output = f_pkgconfig,
        content = pkgconfig(myname, lib_prefix, [f.short_path.split("/")[-1] for d in deps for f in d.cc.libs]),
        )
    
    args = [ 
        "--output=" + output.path,
        "--directory=",
        "--mode=0644",
    ]

    if os != "linux":
        static_libs = list(set([f for d in deps for f in d.cc.static_libs]))
    else:
        static_libs = []
    args += ["--file=%s=%s" % (f.path, lib_prefix + "static/" + sanitize_static_library_path(f.short_path)) for f in static_libs]

    args += ["--file=%s=%s" % (f.path, lib_prefix + f.short_path.split("/")[-1]) for d in deps for f in d.cc.libs]
    args += ["--modes=%s=0755" % (lib_prefix + f.short_path.split("/")[-1]) for d in deps for f in d.cc.libs]
    args += ["--file=%s=%s" % (f.path, "include/" + f.short_path.split("/")[-1]) for f in hdrs]
    args += ["--tar=%s" % f.path for d in deps for f in d.cc.header_tar]
    args += ["--file=%s=%s" % (f.path, "doc/" + f.short_path.split("/")[-1]) for f in docs]
    args += ["--file=%s=%s" % (f.path, "bin/test/" + f.short_path.split("/")[-1]) for f in tests]
    args += ["--modes=%s=0755" % ("bin/test/" + f.short_path.split("/")[-1]) for f in tests]
    args += ["--file=%s=%s" % (f.path, "data/" + f.short_path.split("/")[-1]) for f in data]
    args += ["--file=%s=%s" % (f_changelog.path, "CHANGELOG")]
    args += ["--file=%s=%s" % (f_version.path, "VERSION")]
    args += ["--file=%s=%s" % (f_pkgconfig.path, lib_prefix + "%s.pc.template" % myname)]

    args += [
        "--dir=lib/",
        "--dir=include/",
        "--dir=doc/",
        "--dir=bin/",
        ]

    arg_file = ctx.new_file(ctx.label.name + ".args")
    ctx.file_action(arg_file, "\n".join(args))

    ctx.action(
            executable = build_tar,
            arguments = ["--flagfile=" + arg_file.path],
            inputs = [f_changelog, f_version, f_pkgconfig, arg_file] + ctx.files.deps + static_libs + hdrs + docs + tests + data,
            outputs = [ctx.outputs.out],
            mnemonic="PackageTar"
            )

pkg_mapsv2 = rule(
    implementation = _pkg_mapsv2_impl,
    attrs = {
        "deps": attr.label_list(),
        "extra_hdrs": attr.label_list(),
        "tests": attr.label_list(),
        "data": attr.label_list(allow_files = True),
        "docs": attr.label_list(allow_files = True),
        "extra_changelogs": attr.label_list(),
        # Implicit rules
        "_build_tar": attr.label(
            default=Label("//tools/build_defs/pkg:build_tar"),
            cfg=HOST_CFG,
            executable=True,
            allow_files=True),
        "_is_wibu_enabled": attr.label(default = Label("//tools/toolchain/workaround:wibu_enabled_select")),
        "_os": attr.label(default = Label("//tools/toolchain/workaround:os_select")),
        "_arch": attr.label(default = Label("//tools/toolchain/workaround:arch_select")),
        "_cmode": attr.label(default = Label("//tools/toolchain/workaround:compilation_mode_select")),
        },
    outputs = {
        "out": "%{name}.tar",
        },
    )
