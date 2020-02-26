# frozen_string_literal: true

require 'rubygems'
require 'bundler'
Bundler.setup(:default, ENV['RACK_ENV'])

require_relative 'app'

run App
