# frozen_string_literal: true

module TestConstants
  TRANSLATIONS = JSON.parse(File.read('spec/fixtures/translations.json')).freeze
end
