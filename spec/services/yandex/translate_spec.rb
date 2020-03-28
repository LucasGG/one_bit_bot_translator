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

    def mock_yandex_request(method = :post, url = Yandex::Translate::URL,
                            body:, response:)
      WebMock.stub_request(method, url)
             .with(:body => body)
             .to_return(response)
    end

    context 'with successful yandex output' do
      metafixture('translations.json')

      def yandex_request_response(lang, olang_text)
        %({"code":200,"lang":"#{lang}","text":["#{olang_text}"]})
      end

      before do |example|
        mock_yandex_request(
          :body => hash_including(:text => example.metadata[:left],
                                  :lang => example.metadata[:lang]),
          :response => {
            :status => 200,
            :body => yandex_request_response(example.metadata[:lang],
                                             example.metadata[:right])
          }
        )
      end

      translations.each do |lang, synonyms|
        synonyms.each do |left, right|
          it("translates #{left} to #{right} using #{lang}",
             :lang => lang, :left => left, :right => right) do
            ilang, olang = lang.split('-')
            expect(service.call(**parameters.merge(
              :text => left, :ilang => ilang, :olang => olang
            ))).to eq(right)
          end
        end
      end
    end

    context 'with exceptions on yandex output' do
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
