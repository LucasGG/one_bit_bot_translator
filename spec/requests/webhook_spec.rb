# frozen_string_literal: true

RSpec.describe 'Webhook', :type => :request do
  let(:response) { post('webhook.json') }
  let(:response_parsed_body) { JSON.parse(response.body) }

  it 'have json content type' do
    expect(response.content_type).to include('application/json')
  end

  pending('returns valid fulfillment')
end
