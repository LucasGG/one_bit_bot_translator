# frozen_string_literal: true

WebMock.stub_request(:post, Yandex::URI.merge('/api/v1.5/tr.json/translate'))
       .with(:headers => Yandex::DEFAULT_HEADERS)
       .to_return(:body => '{"code":200,"lang":"en-pt","text":["olá mundo"]}')
