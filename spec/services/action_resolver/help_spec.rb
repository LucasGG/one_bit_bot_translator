# frozen_string_literal: true

RSpec.describe ActionResolver::Help do
  subject(:service) { described_class }

  it_behaves_like 'poro'

  describe 'call' do
    it 'returns a text' do
      expect(service.call.class).to be(String)
    end
  end
end
