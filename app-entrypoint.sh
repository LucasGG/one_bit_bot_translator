#!/usr/bin/env sh
set -e

if [ -f ".env" ]; then export $(cat .env | xargs); fi

$@
