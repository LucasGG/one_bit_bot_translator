# frozen_string_literal: true

RSpec.describe ActionResolver::Interpret do
  subject(:service) { described_class }

  it_behaves_like 'poro'

  describe 'call' do
    let(:parameters) do
      {
        :intent => :help,
        :parameters => {}
      }
    end

    # TODO: Fix where to inject class double
    # Docs: https://relishapp.com/rspec/rspec-mocks/v/3-9/docs
    it 'pipes correctly' do
      help = class_double('ActionResolver::Help')
      allow(help).to receive(:call).with(any_args)
      service.call(**parameters)
      expect(help).to receive(:call)
    end
  end
end
