podman_build_opts := "--skip-unused-stages=false --security-opt=label=disable"

all:
    echo TODO

build target:
    #!/bin/bash
    set -euox pipefail

    mkdir -p "$(pwd)/cache.libdnf5"

    podman build \
        {{podman_build_opts}} \
        --volume "$(pwd):/run/src" \
        --volume "$(pwd)/cache.libdnf5:/output/var/cache/libdnf5:rw,z" \
        --tag {{target}} \
        --file {{target}}/Containerfile \
        {{target}}

    rm -f out.ociarchive

nginx: (build "nginx")

php-fpm-ttrss: (build "php-fpm-ttrss")

unbound: (build "unbound")

toolbox: (build "toolbox")

toolbox-kdedev: (build "toolbox-kdedev")

toolbox-cloud-cli: (build "toolbox-cloud-cli")
