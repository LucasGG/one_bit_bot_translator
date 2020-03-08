#!/usr/bin/env sh
set -e

if [ -f ".env" ]; then export $(cat .env | xargs); fi

bundle check || bundle install -j4 --retry 3

$@
