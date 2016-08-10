def maps_v2_tarball(name, shared_objs):
    native.genrule(
        name = name,
        outs = [name + '_map_v2.tar'],
        cmd = 'tar cfv $@',
        )
