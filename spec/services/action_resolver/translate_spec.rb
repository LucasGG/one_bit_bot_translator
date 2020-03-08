# frozen_string_literal: true

RSpec.describe ActionResolver::Translate do
  subject(:service) { described_class }

  it('inherit service') { expect(service).to be < Service }
end
