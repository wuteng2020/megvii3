package(default_visibility = ['//visibility:public'])

cc_megvii_binary(
    name = 'nasm',
    srcs = [
        "nasm.c", "nasmlib.c", "ver.c", "raa.c", "saa.c", "rbtree.c", "srcfile.c", "realpath.c", "float.c", "insnsa.c", "insnsb.c", "directiv.c", "assemble.c", "labels.c", "hashtbl.c", "crc64.c", "parser.c", "output/outform.c", "output/outlib.c", "output/nulldbg.c", "output/nullout.c", "output/outbin.c", "output/outaout.c", "output/outcoff.c", "output/outelf.c", "output/outelf32.c", "output/outelf64.c", "output/outelfx32.c", "output/outobj.c", "output/outas86.c", "output/outrdf2.c", "output/outdbg.c", "output/outieee.c", "output/outmacho.c", "md5c.c", "output/codeview.c", "preproc.c", "quote.c", "pptok.c", "macros.c", "listing.c", "eval.c", "exprlib.c", "stdscan.c", "strfunc.c", "tokhash.c", "regvals.c", "regflags.c", "ilog2.c", "lib/strlcpy.c", "preproc-nop.c", "disp8.c", "iflag.c",
        ] + glob([
        '**/*.h',
        ]),
    copts = [
        "-Wno-unused-function",
        ],
)
