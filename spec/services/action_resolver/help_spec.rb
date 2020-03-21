# frozen_string_literal: true

RSpec.describe ActionResolver::Help do
  subject(:service) { described_class }

  it_behaves_like 'poro'

  describe 'implementation' do
    let(:parameters) { nil }
  end
end
