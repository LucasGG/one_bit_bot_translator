# frozen_string_literal: true

RSpec.describe DialogFlow::ActionParser do
  subject(:service) { described_class }

  it_behaves_like 'poro'

  describe 'call' do
    # TODO: This is the better implementation?
    def calling(intent)
      service.call(:intent => intent)
    end

    context 'with translation "ola mundo"' do
      fixture('intents/ola_mundo.json', false)

      it('responds to properties') do
        expect(calling(ola_mundo))
          .to responds_to(:action, :language, :text)
      end
    end

    context 'with translation "você é um ciborgue?"' do
      fixture('intents/voce_e_um_ciborgue.json', false)

      it('responds to properties') do
        expect(calling(voce_e_um_ciborgue))
          .to responds_to(:action, :language, :text)
      end
    end

    context 'with invalid input' do
      pending('error handling specification')
      pending('session validation')
    end
  end
end
