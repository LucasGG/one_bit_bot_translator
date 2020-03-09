# frozen_string_literal: true

RSpec.describe Yandex::Translate do
  subject(:service) { described_class }

  let(:parameters) do
    {
      :text => 'Hello world',
      :ilang => 'en',
      :olang => 'pt',
      :format => 'plain',
      :options => nil
    }
  end

  it('inherit service') { expect(service).to be < Service }

  it('translates text to another language') do
    expect(service.call(parameters)).to be('Olá mundo')
  end
end
