# frozen_string_literal: true

RSpec.describe DialogFlow::ActionParser do
  subject(:service) { described_class }

  it_behaves_like 'poro'

  describe 'implementation' do
    let(:parameters) { nil }

    pending('needs tdd')
  end
end
