licenses(["restricted"])  # MPL2, portions GPL v3, LGPL v3, BSD-like

PREFIX="pybind11-2.0.1"

cc_library(
    name = "pybind11_py35m",
    includes = [
        PREFIX + "/include",
        ],
    hdrs = glob([
        PREFIX + "/include/pybind11/*.h"
        ]),
    deps = [
        "@python35m_headers_archive//:headers",
        ],
    visibility = [
        "//visibility:public",
        ],
    )

# The official test.
# We currently do not have a way to run it within Bazel since we do not depend on or include a Python installation (yet)
# If you want to try it out, copy the generated shared object to its test directory and run:
#     python3 -m pytest -rws *.py
# Installing numpy and scipy enables you to run almost all test cases.

cc_megvii_shared_object(
    name = "pybind11_tests_py35m",
    srcs = glob([
        PREFIX + "/tests/*.cpp",
        PREFIX + "/tests/*.h",
        ]),
    syms = [
        "PyInit_pybind11_tests",
        ],
    internal_deps = [
        "pybind11_py35m",
        "@//external:eigen",
        ],
    )
