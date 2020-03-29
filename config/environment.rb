# frozen_string_literal: true

# Configure all environments here.

require 'net/http'

App.configure(:development) do |config|
  config.enable :logging
end

require_relative 'autoloads'
