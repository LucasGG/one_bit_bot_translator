# frozen_string_literal: true

RSpec.describe Yandex::Translate do
  subject(:service) { described_class }

  it_behaves_like 'poro'

  describe 'implementation' do
    let(:parameters) do
      {
        :text => '',
        :ilang => 'en',
        :olang => 'pt',
        :format => 'plain',
        :options => nil
      }
    end

    def mock_yandex_request(method = :post, body:, response:)
      WebMock.stub_request(method, Yandex::Translate::URL)
             .with(:body => body)
             .to_return(response)
    end

    context 'with successful translation yandex output' do
      fixture('translations.json')

      def yandex_request_response(lang, olang_text)
        %({"code":200,"lang":"#{lang}","text":["#{olang_text}"]})
      end

      RSpec.shared_examples 'good translation' do |lang, ilang_text, olang_text|
        before do
          mock_yandex_request(
            :body => hash_including(:text => ilang_text, :lang => lang),
            :response => { :status => 200,
                           :body => yandex_request_response(lang, olang_text) }
          )
        end

        it("translates #{ilang_text} to #{olang_text} using #{lang}") do
          ilang, olang = lang.split('-')
          expect(service.call(**parameters.merge(:text => ilang_text,
                                                 :ilang => ilang,
                                                 :olang => olang)))
            .to eq(olang_text)
        end
      end

      translations.each do |lang, synonyms|
        synonyms.each do |left, right|
          it_behaves_like('good translation', lang, left, right)
        end
      end
    end

    context 'with exceptions on yandex translation output' do
      def yandex_request_response
        '{"code":401,"message":"API key is invalid"}'
      end

      before do
        mock_yandex_request(
          :body => hash_including(:text => '', :lang => 'en-pt', :key => ''),
          :response => { :status => 401, :body => yandex_request_response }
        )
      end

      it 'raise exception if token is invalid' do
        stub_const('Yandex::DEFAULT_REQUEST_DATA', { :key => '' })
        expect { service.call(**parameters) }.to raise_exception(Service::Error)
      end
    end
  end
end
