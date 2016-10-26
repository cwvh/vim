#!/usr/bin/env sh
set -eu

git submodule foreach git pull origin master
