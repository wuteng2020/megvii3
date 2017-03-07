licenses(["permissive"])

cc_library(
    name = "exception_handler",
    srcs = [
        "exception_handler.cpp",
        ],
    deps = [
        "//external:boost",
        ],
    visibility = [
        "//visibility:public",
        ],
    )

cc_library(
    name = "geometry_no_exception_headers",
    hdrs = [
        "boost/geometry/algorithms/detail/relate/result.hpp",
        "boost/geometry/algorithms/detail/overlay/self_turn_points.hpp",
        ],
    includes = [
        ".",
        ],
    visibility = [
        "//visibility:public",
        ],
    )
