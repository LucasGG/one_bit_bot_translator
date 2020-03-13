# frozen_string_literal: true

RSpec.describe Yandex::Translate do
  subject(:service) { described_class }

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
           .with(:body => hash_including(:text => 'Hello world',
                                         :lang => 'en-ru',
                                         :key => ''))
           .to_return(:status => 401,
                      :body => '{"code":401,"message":"API key is invalid"}')
  end

  it('inherit service') { expect(service).to be < Service }

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
end
