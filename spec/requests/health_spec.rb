# frozen_string_literal: true

RSpec.describe '#health', :type => :request do
  let(:response) { get('health.json') }
  let(:response_parsed_body) { JSON.parse(response.body) }

  it 'have json content type' do
    expect(response.content_type).to include('application/json')
  end

  it 'informs the correct environment' do
    expect(response_parsed_body['env']).to eq(ENV['RACK_ENV'])
  end
end
