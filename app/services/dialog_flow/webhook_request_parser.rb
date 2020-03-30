# frozen_string_literal: true

module DialogFlow
  # Parses intents coming from webhook call.
  class WebhookRequestParser < Service
    def initialize(body:)
      @body = body
    end

    def call
      parsed_body = JSON.parse(@body)
      query_result = parsed_body['queryResult']
      raise Error, 'invalid input' unless query_result

      OpenStruct.new(
        :action => query_result['action'],
        :parameters => query_result['parameters']
      )
    end
  end
end
