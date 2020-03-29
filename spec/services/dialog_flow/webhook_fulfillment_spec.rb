# frozen_string_literal: true

RSpec.describe DialogFlow::WebhookFulfillment do
  subject(:service) { described_class }

  it_behaves_like 'poro'

  describe 'call' do
    let(:parameters) { { :response => 'test' } }

    it 'responds to properties' do
      expect(service.call(**parameters).class).to be(Hash)
    end
  end
end
