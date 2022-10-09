#!/usr/bin/env bash

set -eu -o pipefail
#set -x

main() {
    # Do not run as root
    if [[ "${EUID}" == 0 ]]; then
        >&2 echo "[*] Do not run as root!"
        exit 1
    fi

    local -r name='vault'
    local -r base="https://releases.hashicorp.com/${name}"

    if [[ "${#}" -ne 1 ]]; then
        >&2 echo "Usage: ${0} <version>"
        exit 1
    fi
    local -r version="${1}"

    local -r url_sha="${base}/${version}/${name}_${version}_SHA256SUMS"
    local -r url_sig="${base}/${version}/${name}_${version}_SHA256SUMS.sig"

    rm -fv "${name}_${version}_SHA256SUMS" "${name}_${version}_SHA256SUMS.sig"

    echo "[+] Downloading ${name} ${version}"
    wget "${url_sha}"
    wget "${url_sig}"

    echo "[+] Verifying ${name} ${version}"
    gpg --verify "${name}_${version}_SHA256SUMS.sig"

    local -r new_sha="$(grep linux_amd64 "${name}_${version}_SHA256SUMS")"

    sed -i "s/VAULT_VERSION=.*$/VAULT_VERSION=\"${version}\"/" "${name}/Containerfile"
    sed -i "s/VAULT_SHA256=.*$/VAULT_SHA256=\"${new_sha}\"/" "${name}/Containerfile"

    git add "${name}/Containerfile"
    git commit --message "${name}: Update to ${version}"

    rm -v "${name}_${version}_SHA256SUMS" "${name}_${version}_SHA256SUMS.sig"

    echo "[+] Done"
}

main "${@}"
