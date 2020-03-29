# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'test'

if ENV['RACK_ENV'] != 'test'
  raise "Testing application is prohibited outside 'test' environment"
end

require 'rubygems'
require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

WebMock.disable_net_connect!

require_relative '../app'

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
