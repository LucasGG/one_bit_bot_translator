# frozen_string_literal: true

RSpec.describe ActionResolver::Help do
  subject(:service) { described_class }

  let(:parameters) { nil }

  it('inherit service') { expect(service).to be < Service }
end
