# frozen_string_literal: true

module ActionResolver
  # Call translations to another available service.
  class Translate < Service
    CORRESPONDENCES = {
      'português' => 'pt',
      'inglês' => 'en',
      'russo' => 'ru',
      'japonês' => 'jp'
    }.freeze

    def initialize(languages:, text:)
      @languages = languages
      @text = text
    end

    def call
      first_lang, second_lang = @languages
      ilang = language_code(second_lang ? first_lang : 'Português')
      olang = language_code(second_lang || first_lang)
      raise Error, 'languages not identified' unless ilang && olang

      Yandex::Translate.call(:text => @text, :ilang => ilang, :olang => olang)
    end

    private

    def language_code(lang)
      CORRESPONDENCES[lang.downcase]
    end
  end
end
