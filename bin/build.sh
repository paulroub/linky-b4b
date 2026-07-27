#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

npm i --quiet
bundle install --quiet
bundle exec jekyll build --quiet
