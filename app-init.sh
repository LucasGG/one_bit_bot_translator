#!/usr/bin/env sh
set -e

export RACK_ENV=development

bundle check || bundle install -j4 --retry 3

echo 'Preparing database...'
bin/rake db:prepare

echo 'Starting server...'
bin/rackup -o 0.0.0.0
