# frozen_string_literal: true

module ActionResolver
  # Interpret parsed intents, pipe parameters to service and yield.
  class Interpret < Service
    def initialize(intent:)
      @intent = intent
    end

    def call
      service = case @intent.action
                when 'help'
                  Help
                when 'translate'
                  Translate
                end
      service.call(**@intent.parameters)
    end
  end
end
