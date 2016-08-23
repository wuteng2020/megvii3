cc_megvii_shared_object(
    name = "libfpp",
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
    name = "libfpp_fast",
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
