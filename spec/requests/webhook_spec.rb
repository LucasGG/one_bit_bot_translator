# frozen_string_literal: true

RSpec.describe '#webhook', :type => :request do
  fixture('intents/ola_mundo.json', false)

  let(:response) { post('webhook.json', ola_mundo) }
  let(:response_parsed_body) { JSON.parse(response.body) }

  it 'have json content type' do
    expect(response.content_type).to include('application/json')
  end

  pending('returns valid fulfillment')
end
