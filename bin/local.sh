#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

servers=$(pgrep -f 'npm.*decap-server|ekyll' || true)

if [[ -n "$servers" ]]; then
    echo "servers appear to be running already:"
    pgrep -fl 'npm.*decap-server|ekyll'
    exit 0
fi

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$script_dir/.."

source ".venv/linky-b4b/bin/activate"

python bin/config_local.py
git update-index --assume-unchanged admin/config.yml

npx ttab "npx decap-server"
npx ttab "bundle exec jekyll serve --watch"
sleep 2
open "http://localhost:4000"
open "http://localhost:4000/admin"
