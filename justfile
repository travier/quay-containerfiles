# Commands for easier interaction with this repo
# Use this with https://github.com/casey/just

s: status

status:
    #!/usr/bin/bash
    set -euo pipefail
    for b in $(ls .git/refs/remotes/origin | grep -vE 'main|HEAD'); do
        pushd "../${b}" &> /dev/null
        echo "[>] ${b}"
        git status --short
        popd &> /dev/null
    done

l: log

log:
    #!/usr/bin/bash
    set -euo pipefail
    for b in $(ls .git/refs/remotes/origin | grep -vE 'main|HEAD'); do
        pushd "../${b}" &> /dev/null
        echo "[>] ${b}"
        git log --oneline --max-count=3
        popd &> /dev/null
    done

push:
    #!/usr/bin/bash
    set -euo pipefail
    for b in $(ls .git/refs/remotes/origin | grep -vE 'main|HEAD'); do
        pushd "../${b}" &> /dev/null
        echo "[>] ${b}"
        git push
        popd &> /dev/null
    done

sh: show

show:
    #!/usr/bin/bash
    set -euo pipefail
    for b in $(ls .git/refs/remotes/origin | grep -vE 'main|HEAD'); do
        pushd "../${b}" &> /dev/null
        echo "[>] ${b}"
        git show
        popd &> /dev/null
    done

commit message:
    #!/usr/bin/bash
    set -euo pipefail
    for b in $(ls .git/refs/remotes/origin | grep -vE 'main|HEAD'); do
        pushd "../${b}" &> /dev/null
        echo "[>] ${b}"
        git commit -m "{{message}}"
        popd &> /dev/null
    done

# vim: set ts=4 sts=4 sw=4 et ft=sh:
