licenses(["permissive"])

cc_library(
    name = "workarounds",
    srcs = if_android_x86_32([
        "android-piii-workarounds.c",
        ]),
    visibility=[
        "//visibility:public",
        ],
    )
