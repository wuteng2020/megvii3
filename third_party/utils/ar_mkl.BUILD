#The following code were used for merging static libraries but we now use pre-merged ones.

genrule(
   name = "merge_archives-64",
   srcs = [
       "lib/intel64_lin/libmkl_core.a",
       "lib/intel64_lin/libmkl_sequential.a",
       "lib/intel64_lin/libmkl_intel_ilp64.a",
       ],
   outs = [
       "lib/intel64_lin/libmkl_core_sequential_intel_ilp64.a",
       ],
   cmd = "workdir=$$(mktemp -d -t tmp.XXXXXXXXXX); cp $(location lib/intel64_lin/libmkl_core.a) $(location lib/intel64_lin/libmkl_sequential.a) $(location lib/intel64_lin/libmkl_intel_ilp64.a) $${workdir}/; pushd $${workdir} > /dev/null; ar xf libmkl_core.a; ar xf libmkl_sequential.a; ar xf libmkl_intel_ilp64.a; popd > /dev/null; ar rcsD $(@D)/libmkl_core_sequential_intel_ilp64.a $${workdir}/*.o; rm -rf $$workdir;",
)

#The following code were used for merging static libraries but we now use pre-merged ones.

genrule(
   name = "merge_archives-32",
   srcs = [
       "lib/ia32_lin/libmkl_core.a",
       "lib/ia32_lin/libmkl_sequential.a",
       "lib/ia32_lin/libmkl_intel.a",
       ],
   outs = [
       "lib/ia32_lin/libmkl_core_sequential_intel_32.a",
       ],
   cmd = "workdir=$$(mktemp -d -t tmp.XXXXXXXXXX); cp $(location lib/ia32_lin/libmkl_core.a) $(location lib/ia32_lin/libmkl_sequential.a) $(location lib/ia32_lin/libmkl_intel.a) $${workdir}/; pushd $${workdir} > /dev/null; ar xf libmkl_core.a; ar xf libmkl_sequential.a; ar xf libmkl_intel.a; popd > /dev/null; ar rcsD $(@D)/libmkl_core_sequential_intel_32.a $${workdir}/*.o; rm -rf $$workdir;",
)