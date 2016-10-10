workspace(name = "megvii3")

repo = "http://brain-ftp.megvii-inc.com/"

load("//third_party:third_party.bzl", "load_third_party_libraries")
load_third_party_libraries(repo)
load("//tools/toolchain:toolchain_workspace.bzl", "load_toolchain_libraries")
load_toolchain_libraries(repo)

load("//tools/bazel-version:bazel-version.bzl", "check_version")
check_version(["0.4.0-megvii1", "0.4.0-megvii1-jdk8"])
