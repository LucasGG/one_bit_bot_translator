# frozen_string_literal: true

# Application base class.
class App < Sinatra::Base
  require_relative 'config/environment'

  get '/health.json' do
    content_type :json, :charset => 'utf-8'
    { :env => ENV['RACK_ENV'] }.to_json
  end

  post '/webhook.json' do
    content_type :json, :charset => 'utf-8'

    # TODO: Validate authentication.

    request.body.rewind
    intent = DialogFlow::WebhookRequestParser.call(:body => request.body.read)
    ActionResolver::Interpret.call(:intent => intent) do |pipe, _parameters|
      case pipe
      when :help
        DialogFlow::WebhookFulfillment.call.to_json
      when :translate
        DialogFlow::WebhookFulfillment.call.to_json
      end
    end
  end
end
