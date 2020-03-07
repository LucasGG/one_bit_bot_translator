# frozen_string_literal: true

Dir['./app/services/**/*.rb'].sort.each { |file| require file }

require 'sinatra/base'

# Base class for a Web App, see Sinatra documentation.
# TODO:
# - https://cloud.google.com/dialogflow/docs/integrations/telegram
# - https://cloud.google.com/dialogflow/docs/fulfillment-overview
class App < Sinatra::Base
  require_relative 'config/environment'

  get '/health.json' do
    content_type :json, :charset => 'utf-8'
    { :env => ENV['RACK_ENV'] }.to_json
  end

  post '/webhook' do
    request.body.rewind
    result = JSON.parse(request.body.read)['queryResult']

    # TODO: Proccess intent here...
    if result['contexts'].present?
      response = InterpretService.call(result['action'],
                                       result['contexts'][0]['parameters'])
    else
      response = InterpretService.call(result['action'], result['parameters'])
    end

    # TODO: Return translation here with Telegram payload...
    content_type :json, :charset => 'utf-8'
    {
      :fulfillmentText => response,
      :payload => {
        :telegram => {
          :text => response,
          :parse_mode => 'Markdown'
        }
      }
    }.to_json
  end
end
