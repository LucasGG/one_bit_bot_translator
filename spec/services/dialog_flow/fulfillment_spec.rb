# frozen_string_literal: true

RSpec.describe DialogFlow::Fulfillment do
  subject(:service) { described_class }

  it_behaves_like 'poro'

  describe 'call' do
    let(:parameters) { { :text => 'test' } }

    it 'responds to properties' do
      expect(service.call(**parameters))
        .to responds_to(:response)
    end
  end
end
