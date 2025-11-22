#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$script_dir/.."

pgrep -f 'npm.*decap-server|ekyll' | \
    xargs -r kill || true

git update-index --no-assume-unchanged admin/config.yml
git checkout -- admin/config.yml
