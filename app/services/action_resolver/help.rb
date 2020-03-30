# frozen_string_literal: true

module ActionResolver
  # Usage specification.
  class Help < Service
    HELP = %(
      Olá!

      Para usar o serviço fale "traduza peixe em japonês"
    )

    def call
      languages = ActionResolver::Translate::LANGUAGES.keys.join(', ')
      help = "Olá!\n"
      help += "Comece com 'traduza o rato roeu a roupa do rei de Roma" \
              "para russo'"
      help + "Línguas aceitas: #{languages}"
    end
  end
end
