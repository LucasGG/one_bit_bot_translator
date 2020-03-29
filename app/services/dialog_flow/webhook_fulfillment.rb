# frozen_string_literal: true

module DialogFlow
  # Creates fulfillment openstruct.
  # Docs: https://cloud.google.com/dialogflow/docs/fulfillment-how#webhook_request
  # Ex.:
  # {
  #   :fulfillmentText => response,
  #   :payload => {
  #     :telegram => {
  #       :text => response,
  #       :parse_mode => 'Markdown'
  #     }
  #   }
  # }
  class WebhookFulfillment < Service
    def call; end
  end
end
