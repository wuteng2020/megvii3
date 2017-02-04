licenses(["restricted"])

cc_library(
    name = "headers",
    includes = [
        "include/python",
        ],
    hdrs = glob([
        "include/python/*.h",
        ]),
    deps = [
        "@//third_party/python-3.5m-headers:pyconfig",
        ],
    visibility = [
        "//visibility:public",
        ],
    )
