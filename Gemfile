# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Sinatra is a DSL for quickly creating web applications in Ruby.
gem 'sinatra', :github => 'sinatra/sinatra', :require => 'sinatra/base'

# Rake is a Make-like program implemented in Ruby.
gem 'rake'

group :development do
  # Holy!
  gem 'rubocop', :require => false
  gem 'rubocop-performance', :require => false
  gem 'rubocop-rspec', :require => false
end

group :test do
  # Framework.
  gem 'rack-test', :require => 'rack/test'
  gem 'rspec'

  # Auxiliary libs.
  gem 'faker'
  gem 'webmock', :require => 'webmock/rspec'

  # Coverage.
  gem 'simplecov', :require => false
end

group :development, :test do
  # :|
  # Version lock because current version of pry-byebug is imcompatible.
  gem 'pry', '~> 0.12.2'
  gem 'pry-byebug'
end
