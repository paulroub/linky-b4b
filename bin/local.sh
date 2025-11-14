#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$script_dir/.."

source ".venv/calhoun/bin/activate"

python bin/config_local.py

npx ttab "npx decap-server"
npx ttab "bundle exec jekyll serve --watch"
sleep 2
open "http://localhost:4000"
open "http://localhost:4000/admin"
