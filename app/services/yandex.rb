# frozen_string_literal: true

# Translation API.
module Yandex
  dir = File.join(__dir__, 'yandex')

  autoload('Translate', File.join(dir, 'translate.rb'))

  URL = URI(ENV['YANDEX_URI'])
  TOKEN = ENV['YANDEX_TOKEN']
  DEFAULT_HEADERS = {
    'Accept' => 'application/json',
    'Content-Type' => 'application/x-www-form-urlencoded'
  }.freeze
  DEFAULT_REQUEST_DATA = { :key => TOKEN }.freeze
end
