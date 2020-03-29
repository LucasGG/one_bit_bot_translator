# frozen_string_literal: true

# Translation service.
module Yandex
  URL = URI(ENV['YANDEX_URI'])
  TOKEN = ENV['YANDEX_TOKEN']
  DEFAULT_HEADERS = {
    'Accept' => 'application/json',
    'Content-Type' => 'application/x-www-form-urlencoded'
  }.freeze
  DEFAULT_REQUEST_DATA = { :key => TOKEN }.freeze

  dir = File.join(__dir__, 'yandex')

  autoload('Translate', File.join(dir, 'translate.rb'))
end
