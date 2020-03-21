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

    before do
      TestConstants::TRANSLATIONS.each do |lang, correlations|
        correlations.each do |ilang_text, olang_text|
          WebMock.stub_request(:post, Yandex::Translate::URL)
                 .with(
                   :body => hash_including(:text => ilang_text, :lang => lang)
                 ).to_return(:status => 200,
                             :body => %({"code":200,"lang":"#{lang}", \
                                        "text":["#{olang_text}"]}))
        end
      end

      WebMock.stub_request(:post, Yandex::Translate::URL)
             .with(:body => hash_including(:text => '',
                                           :lang => 'en-pt',
                                           :key => ''))
             .to_return(:status => 401,
                        :body => '{"code":401,"message":"API key is invalid"}')
    end

    TestConstants::TRANSLATIONS.each do |lang, correlations|
      correlations.each do |ilang_text, olang_text|
        it("translates #{ilang_text} to #{olang_text} using #{lang}") do
          ilang, olang = lang.split('-')
          expect(service.call(**parameters.merge(:text => ilang_text,
                                                 :ilang => ilang,
                                                 :olang => olang)))
            .to eq(olang_text)
        end
      end
    end

    it 'raise exception if interface fail' do
      stub_const('Yandex::DEFAULT_REQUEST_DATA', { :key => '' })
      expect { service.call(**parameters) }.to raise_exception(Service::Error)
    end
  end
end
