def register_libraries(*lib_infos):
    """Register a library to system"""

    result = {}
    for lib_info_dict in lib_infos:
        lib = lib_info_dict["name"]
        version = lib_info_dict["version"]
        targets = []
        if "targets" in lib_info_dict:
            if type(lib_info_dict["targets"]) == "list":
                targets = lib_info_dict["targets"]
            if type(lib_info_dict["targets"]) == "string":
                targets.append(lib_info_dict["targets"])
        else:
            targets.append(lib)
        if "sha256" in lib_info_dict and lib_info_dict["sha256"]:
            result.update({
                "%s-%s" % (lib, version): {
                    "name": lib,
                    "version": version,
                    "sha256": lib_info_dict["sha256"] if "sha256" in lib_info_dict else None,
                    "urls": lib_info_dict["urls"] if "urls" in lib_info_dict else None,
                    "strip_prefix": lib_info_dict["strip_prefix"] if "strip_prefix" in lib_info_dict else None,
                    "build_file": lib_info_dict["build_file"] if "build_file" in lib_info_dict else None,
                    "patch_cmds": lib_info_dict["patch_cmds"] if "patch_cmds" in lib_info_dict else None,
                    "targets": targets,
                },
            })
        if "remote" in lib_info_dict and lib_info_dict["remote"]:
            result.update({
                "%s-%s" % (lib, version): {
                    "name": lib,
                    "version": version,
                    "remote": lib_info_dict["remote"] if "remote" in lib_info_dict else None,
                    "commit": lib_info_dict["commit"] if "commit" in lib_info_dict else None,
                    "branch": lib_info_dict["branch"] if "branch" in lib_info_dict else None,
                    "tag": lib_info_dict["tag"] if "tag" in lib_info_dict else None,
                    "shallow_since": lib_info_dict["shallow_since"] if "shallow_since" in lib_info_dict else None,
                    "build_file": lib_info_dict["build_file"] if "build_file" in lib_info_dict else None,
                    "patch_cmds": lib_info_dict["patch_cmds"] if "patch_cmds" in lib_info_dict else None,
                    "targets": targets,
                },
            })

    return result
