# frozen_string_literal: true

RSpec.describe Yandex::Translate do
  subject(:service) { described_class }

  let(:parameters) { nil }

  it('inherit service') { expect(service).to be < Service }
end
