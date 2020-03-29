# frozen_string_literal: true

RSpec.describe ActionResolver::Translate do
  subject(:service) { described_class }

  it_behaves_like 'poro'

  describe 'call' do
    let(:parameters) do
      {
        parameters: {
          'languages' => ['Inglês'],
          'text' => 'olá mundo'
        }
      }
    end

    before do
      yandex_translate_double = class_double('Yandex::Translate')
      allow(yandex_translate_double)
        .to receive(:call).with(any_args)
                          .and_return('hello world')
      stub_const('Yandex::Translate', yandex_translate_double)
    end

    it 'returns translated text' do
      expect(service.call(**parameters).class).to be(String)
    end
  end
end
