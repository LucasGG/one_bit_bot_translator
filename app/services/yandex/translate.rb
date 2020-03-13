# frozen_string_literal: true

module Yandex
  # Translates one language to another using 'translate' interface.
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
      # TODO: Ver como validar erros...
      response_body = JSON.parse(response.body)
      response_body['text'].first
    end

    private

    def request_data
      hash = DEFAULT_REQUEST_DATA.merge(
        :text => @text,
        :lang => "#{@ilang}-#{@olang}",
        :format => @format,
        :options => @options
      ).compact
      URI.encode_www_form(hash)
    end
  end
end
