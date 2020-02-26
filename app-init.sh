#!/usr/bin/env sh
set -e

if [ -z "${RACK_ENV}" ]
then
  export RACK_ENV=development
fi

bundle check || bundle install -j4 --retry 3

echo 'Starting server...'
bin/rackup -o 0.0.0.0
