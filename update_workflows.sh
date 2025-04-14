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

    apps=(
        'filebrowser'
        'nginx'
        'php-fpm-ttrss'
        'unbound'
    )
    toolboxes=(
        'toolbox-kdedev'
        'toolbox'
    )

    for c in "${apps[@]}"; do
        generate "${c}" ".github_workflows_template.yml"
    done
    for c in "${toolboxes[@]}"; do
        generate "${c}" ".github_workflows_template_toolbox.yml"
    done
}

generate() {
    local -r name="${1}"
    local -r template="${2}"

    {
    sed \
        -e "s|%%NAME%%|${name}|g" \
        "${template}"
    } > ".github/workflows/${name}.yml"
}

main "${@}"
