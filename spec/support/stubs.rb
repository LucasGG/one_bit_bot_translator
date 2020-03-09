# frozen_string_literal: true

WebMock.stub_request(:post, Yandex::Translate::URL)
       .to_return(:status => 200,
                  :body => '{"code":200,"lang":"en-pt","text":["Olá mundo"]}')
