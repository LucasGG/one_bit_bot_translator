# frozen_string_literal: true

RSpec.describe ActionResolver::Help do
  subject(:service) { described_class }

  it_behaves_like 'poro'

  describe 'call' do
    let(:parameters) { nil }

    pending('tdd')
  end
end
