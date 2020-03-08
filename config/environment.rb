# frozen_string_literal: true

# Configure all environments here.

App.configure(:development) do |config|
  config.enable :logging
end

App.configure do |config|
  # Push services to autoloading.
  AutoloadReloader::Paths.push(File.join(config.root, 'app', 'services'))
end
