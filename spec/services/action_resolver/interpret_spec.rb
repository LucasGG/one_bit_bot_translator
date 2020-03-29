# frozen_string_literal: true

RSpec.describe ActionResolver::Interpret do
  subject(:service) { described_class }

  it_behaves_like 'poro'

  describe 'call' do
    let(:parameters) do
      {
        :intent => OpenStruct.new(
          action: 'help',
          parameters: {}
        )
      }
    end

    it 'pipes correctly' do
      help_double = class_double('ActionResolver::Help')
      allow(help_double).to receive(:call).with(any_args)
      stub_const('ActionResolver::Help', help_double)
      service.call(**parameters)
      expect(help_double).to have_received(:call)
    end
  end
end
