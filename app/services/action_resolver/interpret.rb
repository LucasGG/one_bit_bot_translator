# frozen_string_literal: true

module ActionResolver
  # Interpret parsed intents and pipe parameter to yield.
  # Returns the objects from yield.
  #   if result['contexts'].present?
  #   response = InterpretService.call(result['action'],
  #                                    result['contexts'][0]['parameters'])
  # else
  #   response = InterpretService.call(result['action'], result['parameters'])
  # end
  class Interpret < Service
    def call; end
  end
end
