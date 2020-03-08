# frozen_string_literal: true

RSpec.describe DialogFlow::ActionParser do
  subject(:service) { described_class }

  let(:parameters) { nil }

  it('inherit service') { expect(service).to be < Service }
end
