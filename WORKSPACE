workspace(name = "megvii3")

repo = "http://brain-ftp.megvii-inc.com/"

load("//third_party:third_party.bzl", "load_third_party_libraries")
load_third_party_libraries(repo)
load("//tools/toolchain:toolchain_workspace.bzl", "load_toolchain_libraries")
load_toolchain_libraries(repo)

load("//tools/bazel-version:bazel-version.bzl", "check_version")
# the version we released didn't include the tag so we cannot really check it.
#check_version(["0.3.1-megvii3"])
