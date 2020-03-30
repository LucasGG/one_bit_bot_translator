# frozen_string_literal: true

module ActionResolver
  # Interpret parsed intents, pipe parameters to service and yield.
  class Interpret < Service
    PIPELINE = {
      'help' => 'ActionResolver::Help',
      'translate' => 'ActionResolver::Translate'
    }.freeze

    def initialize(intent:)
      @intent = intent
    end

    def call
      service = Object.const_get(PIPELINE[@intent.action])
      raise Error, 'action not found' unless service

      service.call(**@intent.parameters.transform_keys(&:to_sym))
    end
  end
end
