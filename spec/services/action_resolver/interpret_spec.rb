# frozen_string_literal: true

RSpec.describe ActionResolver::Interpret do
  subject(:service) { described_class }

  it_behaves_like 'poro'

  describe 'call' do
    def intent(action)
      OpenStruct.new(:action => action, :parameters => {})
    end

    ActionResolver::Interpret::PIPELINE.each_pair do |action, class_name|
      it "pipes correctly to #{class_name}" do
        piped_class_double = class_double(class_name)
        allow(piped_class_double).to receive(:call).with(any_args)
        stub_const(class_name, piped_class_double)
        service.call(:intent => intent(action))
        expect(piped_class_double).to have_received(:call)
      end
    end
  end
end
