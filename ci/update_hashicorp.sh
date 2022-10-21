#!/usr/bin/env bash

set -eu -o pipefail

get_id() {
    if [[ "$#" -ne 1 ]]; then
        echo "This function needs a project name as parameter"
        return 1
    fi
    case "${1}" in
        "consul")
            echo "10952"
            ;;
        "nomad")
            echo "141380"
            ;;
        "vault")
            echo "12342"
            ;;
        *)
            echo "Unsupported project: ${1}"
            return 1
            ;;
    esac
}

main() {
    projects=(
        'consul'
        'nomad'
        'vault'
    )

    for p in "${projects[@]}"; do
        name="${p}"
        base="https://releases.hashicorp.com/${name}"

        current_version="$(eval "$(grep VERSION ${name}/Containerfile | head -1 | cut -f2 -d\  )"; echo $VERSION)"

        project_id="$(get_id "${name}")"
        version="$(curl "https://release-monitoring.org/api/v2/versions/?project_id=${project_id}" | jq --raw-output '.stable_versions[0]')"

        echo "Project: ${name} - Current: $current_version -> Latest: $version"
        if [[ "${current_version}" == "${version}" ]]; then
            continue
        fi

        url_sha="${base}/${version}/${name}_${version}_SHA256SUMS"
        url_sig="${base}/${version}/${name}_${version}_SHA256SUMS.sig"

        rm -fv "${name}_${version}_SHA256SUMS" "${name}_${version}_SHA256SUMS.sig"

        echo "[+] Downloading ${name} ${version}"
        wget "${url_sha}"
        wget "${url_sig}"

        echo "[+] Verifying ${name} ${version}"
        gpg --verify "${name}_${version}_SHA256SUMS.sig"

        new_sha="$(grep linux_amd64 "${name}_${version}_SHA256SUMS")"

        sed -i "0,/VERSION=.*$/{s//VERSION=\"${version}\"/}" "${name}/Containerfile"
        sed -i "0,/SHA256=.*$/{s//SHA256=\"${new_sha}\"/}" "${name}/Containerfile"

        git add "${name}/Containerfile"
        git commit --message "${name}: Update to ${version}"

        rm -v "${name}_${version}_SHA256SUMS" "${name}_${version}_SHA256SUMS.sig"
    done

    echo "[+] Done"
}

main "${@}"
