# frozen_string_literal: true

module ActionResolver
  # Usage specification.
  class Help < Service
    def call
      languages = ActionResolver::Translate::LANGUAGES.keys.join(', ')
      help = "Olá!\n"
      help += "Comece com 'traduza o rato roeu a roupa do rei de Roma " \
              "para russo'\n"
      help + "Línguas aceitas: #{languages}"
    end
  end
end
