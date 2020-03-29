# frozen_string_literal: true

module ActionResolver
  # Call translations to another available service.
  class Translate < Service
    def initialize(languages:, text:)
      @languages = languages
      @text = text
    end

    def call
      # @parameters['languages'].first
      Yandex::Translate.call(:text => @text,
                             :ilang => 'pt',
                             :olang => 'en')
    end
  end
end
