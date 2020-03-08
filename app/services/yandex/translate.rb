# frozen_string_literal: true

module Yandex
  # Translates one language to another.
  class Translate < Service
    SUFFIX = '/api/v1.5/tr.json/translate'
  end
end
