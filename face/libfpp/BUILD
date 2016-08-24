cc_megvii_shared_object(
    name = "fpp",
    deps = [
        "//face/fppapi-search:fpps",
        "//face/fppapi-gpu:recog",
        "//face/tk1-faceattr:landmark",
        "//face/fpp-version:fpp-version",
        ],
    syms = [
        "MGCARDPP_*",
        "FPPS_*",
        "FPPSU_*",
        "MG_PT_*",
        "MG_DT_*",
        "LIBFPP_*",
        "FPPGPU_*",
        ],
)

cc_megvii_shared_object(
    name = "fpp_fast",
    deps = [
        "//face/fppapi-search:fpps",
        "//face/fppapi-gpu:recog",
        "//face/tk1-faceattr:landmark_fast",
        "//face/fpp-version:fpp-version",
        ],
    syms = [
        "MGCARDPP_*",
        "FPPS_*",
        "FPPSU_*",
        "MG_PT_*",
        "MG_DT_*",
        "LIBFPP_*",
        "FPPGPU_*",
        ],
)

cc_megvii_test(
    name = "fppapi-search-test",
    deps = [
        ":fpp",
        "//face/fppapi-search:fpps_test_lib",
        ],
)

cc_megvii_test(
    name = "fppapi-search-test_fast",
    deps = [
        ":fpp_fast",
        "//face/fppapi-search:fpps_test_lib",
        ],
)

pkg_mapsv2(
    name = "libfpp-mapsv2",
    deps = [
        ":fpp",
        ],
    tests = [
        ":fppapi-search-test",
        ],
)

pkg_mapsv2(
    name = "libfpp_fast-mapsv2",
    deps = [
        ":fpp_fast",
        ],
    tests = [
        ":fppapi-search-test_fast",
        ],
)
