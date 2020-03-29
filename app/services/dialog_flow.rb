# frozen_string_literal: true

# Natural language interpreter service.
module DialogFlow
  dir = File.join(__dir__, 'dialog_flow')

  autoload('WebhookRequestParser', File.join(dir, 'webhook_request_parser.rb'))
  autoload('WebhookFulfillment', File.join(dir, 'webhook_fulfillment.rb'))
end
