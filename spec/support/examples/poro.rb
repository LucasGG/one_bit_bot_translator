# frozen_string_literal: true

RSpec.shared_examples 'poro' do
  it('inherit service') { expect(subject).to be < Service }
end
