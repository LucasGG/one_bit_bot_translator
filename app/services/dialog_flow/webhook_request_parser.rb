# frozen_string_literal: true

module DialogFlow
  # Parses intents coming from webhook call.
  # Docs: https://cloud.google.com/dialogflow/docs/fulfillment-how#webhook_request
  class WebhookRequestParser < Service
    def initialize(body:)
      @body = body
    end

    def call; end
  end
end
