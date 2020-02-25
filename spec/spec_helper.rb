# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'test'

if ENV['RACK_ENV'] == 'production'
  raise 'Testing application is prohibited in production'
end

require 'rubygems'
require 'bundler'
Bundler.setup(:default, ENV['RACK_ENV'])

require 'rack/test'
require 'rspec'

require_relative '../app.rb'

Dir['./spec/support/**/*.rb'].sort.each { |file| require file }

module RSpecMixin
  include Rack::Test::Methods

  def app
    App
  end
end

RSpec.configure do |config|
  config.include RSpecMixin
end
