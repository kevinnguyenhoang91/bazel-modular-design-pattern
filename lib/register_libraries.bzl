load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive",
)
load(
    "@bazel_tools//tools/build_defs/repo:git.bzl",
    "new_git_repository",
)
load(
    "@modular_pattern_example//lib:modular.bzl",
    "register_libraries",
)

#============================================================

load(
    "@modular_pattern_example//lib/Lottie-3.1.6:lib.bzl",
    Lottie_3_1_6 = "lib",
)

LIBRARIES = register_libraries(
    Lottie_3_1_6,
)

#============================================================

def library(lib, version):
    """Plug a library dependencies into a Bazel project
        Args:
            name: Unique name of a library. E.g. Lottie
            version: Version of a library. E.g. 3.1.6
    """

    name = "%s-%s" % (lib, version)
    if name in LIBRARIES:
        if "commit" in LIBRARIES[name] and LIBRARIES[name]["commit"]:
            new_git_repository(
                name = LIBRARIES[name]["name"],
                remote = LIBRARIES[name]["remote"],
                build_file = LIBRARIES[name]["build_file"],
                commit = LIBRARIES[name]["commit"],
                shallow_since = LIBRARIES[name]["shallow_since"],
                patch_cmds = LIBRARIES[name]["patch_cmds"],
            )
        if "branch" in LIBRARIES[name] and LIBRARIES[name]["branch"]:
            new_git_repository(
                name = LIBRARIES[name]["name"],
                remote = LIBRARIES[name]["remote"],
                build_file = LIBRARIES[name]["build_file"],
                branch = LIBRARIES[name]["branch"],
                shallow_since = LIBRARIES[name]["shallow_since"],
                patch_cmds = LIBRARIES[name]["patch_cmds"],
            )
        if "tag" in LIBRARIES[name] and LIBRARIES[name]["tag"]:
            new_git_repository(
                name = LIBRARIES[name]["name"],
                remote = LIBRARIES[name]["remote"],
                build_file = LIBRARIES[name]["build_file"],
                tag = LIBRARIES[name]["tag"],
                shallow_since = LIBRARIES[name]["shallow_since"],
                patch_cmds = LIBRARIES[name]["patch_cmds"],
            )
        if "sha256" in LIBRARIES[name] and LIBRARIES[name]["sha256"]:
            http_archive(
                name = LIBRARIES[name]["name"],
                urls = LIBRARIES[name]["urls"],
                build_file = LIBRARIES[name]["build_file"],
                strip_prefix = LIBRARIES[name]["strip_prefix"],
                sha256 = LIBRARIES[name]["sha256"],
                patch_cmds = LIBRARIES[name]["patch_cmds"],
            )
    else:
        fail("ERROR: Library \"%s\" is not supported!" % name)
