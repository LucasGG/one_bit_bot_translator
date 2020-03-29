# frozen_string_literal: true

module Yandex
  # Translates one language to another using Yandex 'translate' interface.
  # Docs: https://tech.yandex.com/translate/doc/dg/reference/translate-docpage/
  class Translate < Service
    SUFFIX = '/api/v1.5/tr.json/translate'
    URL = URL.merge(SUFFIX)

    def initialize(text:, ilang:, olang:, format: 'plain', options: nil)
      @text = text
      @ilang = ilang
      @olang = olang
      @format = format
      @options = options
    end

    def call
      response = Net::HTTP.post(URL, request_data, DEFAULT_HEADERS)
      handle(response)
    end

    private

    def handle(response)
      case response
      when Net::HTTPSuccess
        success(response)
      else
        fail(response)
      end
    end

    def success(response)
      response_body = JSON.parse(response.body)
      response_body['text'].first
    end

    # TODO: Do support for types of errors.
    def fail(_response)
      raise Error, 'yandex translation failed'
    end

    def request_data
      data = DEFAULT_REQUEST_DATA.merge(
        :text => @text,
        :lang => "#{@ilang}-#{@olang}",
        :format => @format,
        :options => @options
      ).compact
      URI.encode_www_form(data)
    end
  end
end
