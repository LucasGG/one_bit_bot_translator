# frozen_string_literal: true

# Configure all environments here.

App.configure(:development) do |config|
  config.enable :logging
end

require_relative 'dependencies'
require_relative 'autoloads'
