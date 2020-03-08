# frozen_string_literal: true

RSpec.describe ActionResolver::Help do
  subject(:service) { described_class }

  it('inherit service') { expect(service).to be < Service }

  it('call return a string') { expect(service.call).to be_a(String) }
end
