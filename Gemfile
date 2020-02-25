# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Sinatra is a DSL for quickly creating web applications in Ruby..
gem 'sinatra', :github => 'sinatra/sinatra'

# ORM (object-relational mapping).
gem 'activerecord'
gem 'sinatra-activerecord'

# Rake is a Make-like program implemented in Ruby.
gem 'rake'

# postgresql super database
gem 'pg'
gem 'pg_search'

# pry the Universe!
gem 'pry'

group :development do
  # Holy rubocop!
  gem 'rubocop', :require => false
  gem 'rubocop-performance', :require => false
  gem 'rubocop-rspec', :require => false
end

group :test do
  # Test framework.
  gem 'rack-test', :require => 'rack/test'
  gem 'rspec'

  # Auxiliary test libs.
  gem 'database_cleaner-active_record',
      :require => 'database_cleaner/active_record'
  gem 'factory_bot'
  gem 'faker'
end
