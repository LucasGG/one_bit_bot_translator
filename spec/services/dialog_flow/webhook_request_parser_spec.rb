# frozen_string_literal: true

RSpec.describe DialogFlow::WebhookRequestParser do
  subject(:service) { described_class }

  it_behaves_like 'poro'

  describe 'call' do
    context 'with translation "ola mundo"' do
      fixture('intents/ola_mundo.json', false)

      it('responds to properties') do
        expect(service.call(:body => ola_mundo))
          .to respond_to(:action, :parameters)
      end
    end

    context 'with translation "você é um ciborgue?"' do
      fixture('intents/voce_e_um_ciborgue.json', false)

      it('responds to properties') do
        expect(service.call(:body => voce_e_um_ciborgue))
          .to respond_to(:action, :parameters)
      end
    end

    context 'with invalid input' do
      pending('error handling specification')
      pending('session validation')
    end
  end
end
