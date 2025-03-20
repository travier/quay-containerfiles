#!/bin/bash

# Re-generate the GitHub workflows based on a template. We do not use a matrix
# build strategy in GitHub worflows to be able to condition each build job on
# changes to relevant files.

set -euo pipefail
# set -x

main() {
    if [[ ! -d .github ]] || [[ ! -d .git ]]; then
        echo "This script must be run at the root of the repo"
        exit 1
    fi

    containers=(
        'filebrowser'
        'nginx'
        'php-fpm-ttrss'
        'toolbox-kdedev'
        'toolbox'
        'unbound'
    )

    for c in "${containers[@]}"; do
        generate "${c}"
    done
}

generate() {
    local -r name="${1}"

    local -r template=".github_workflows_template.yml"

    {
    sed \
        -e "s|%%NAME%%|${name}|g" \
        "${template}"
    } > ".github/workflows/${name}.yml"
}

main "${@}"
