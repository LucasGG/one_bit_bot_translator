# frozen_string_literal: true

RSpec.describe ActionResolver::Translate do
  subject(:service) { described_class }

  it_behaves_like 'poro'

  describe 'call' do
    let(:parameters) do
      {
        :input_language => 'pt',
        :output_language => 'en',
        :input_text => 'olá mundo'
      }
    end

    it 'translates text' do
      expect(service.call(**parameters).class).to be(String)
    end
  end
end
