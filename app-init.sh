#!/usr/bin/env sh
set -e

if [ -z "${RACK_ENV}" ]
then
  echo "Automatic setting environment to 'development'"
  export RACK_ENV=development
fi

echo 'Starting server...'
bin/rackup -o 0.0.0.0
