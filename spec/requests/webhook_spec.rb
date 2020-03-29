# frozen_string_literal: true

RSpec.describe '#webhook', :type => :request do
  fixture('intents/ola_mundo.json', false)

  let(:response) { post('webhook.json', ola_mundo) }
  let(:response_parsed_body) { JSON.parse(response.body) }

  before do
    yandex_translate_double = class_double('Yandex::Translate')
    allow(yandex_translate_double)
      .to receive(:call).with(any_args)
                        .and_return('hello world')
    stub_const('Yandex::Translate', yandex_translate_double)
  end

  it 'have json content type' do
    expect(response.content_type).to include('application/json')
  end

  pending('returns valid fulfillment')
end
