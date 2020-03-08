# frozen_string_literal: true

# Contains the services declarations and autoloads for all their classes.

# Revolve actions of users received from DialogFlow.
module ActionResolver
  dir = File.join(__dir__, 'action_resolver')

  autoload('Help', File.join(dir, 'help.rb'))
  autoload('Interpret', File.join(dir, 'interpret.rb'))
  autoload('Translate', File.join(dir, 'translate.rb'))
end

# Natural language interpreter API.
module DialogFlow
  dir = File.join(__dir__, 'dialog_flow')

  autoload('ActionParser', File.join(dir, 'action_parser.rb'))
  autoload('Fullfilment', File.join(dir, 'fullfilment.rb'))
end

# Translation API.
module Yandex
  dir = File.join(__dir__, 'yandex')

  autoload('Translate', File.join(dir, 'translate.rb'))

  URI = URI(ENV['YANDEX_URI'])
  TOKEN = ENV['YANDEX_TOKEN']
  DEFAULT_HEADERS = {
    'Content-Type' => 'application/json',
    'Accept' => 'application/json'
  }.freeze
end
