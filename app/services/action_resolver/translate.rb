# frozen_string_literal: true

module ActionResolver
  # Call translations to another available service.
  class Translate < Service
    def initialize(parameters:)
      @parameters = parameters
    end

    def call
      # @parameters['languages'].first
      Yandex::Translate.call(text: @parameters['text'],
                             ilang: 'pt',
                             olang: 'en')
    end
  end
end
