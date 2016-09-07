licenses(["restricted"])  # MPL2, portions GPL v3, LGPL v3, BSD-like

cc_library(
    name = "eigen3",
    hdrs = glob([
        "eigen3/Eigen/Core",
        "eigen3/Eigen/LU",
        "eigen3/Eigen/Cholesky",
        "eigen3/Eigen/Eigenvalues",
        "eigen3/Eigen/QR",
        "eigen3/unsupported/Eigen/CXX11/Tensor",
        "eigen3/unsupported/Eigen/CXX11/FixedPoint",
        "eigen3/unsupported/Eigen/CXX11/src/FixedPoint/*.h",
    ]),
    includes = ["."],
    visibility = ["//visibility:public"],
    deps = [
        "@eigen_archive//:eigen",
    ],
)
