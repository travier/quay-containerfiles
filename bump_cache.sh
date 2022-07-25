#!/bin/bash

set -euo pipefail
# set -x

date="$(date --iso-8601)"
suffix=""
for f in */Containerfile; do
    sed -i "s/# nocache .*$/# nocache ${date}${suffix}/" "${f}"
done
