#!/usr/bin/env bash

npm_bin=$(npm bin)

echo "This takes a while"

npm cache clean --silent
npm install --no-spin --silent
bower cache clean --silent
bower install --silent

export PATH="$npm_bin:$PATH"

ember --version
