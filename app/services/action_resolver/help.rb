# frozen_string_literal: true

module ActionResolver
  # Usage specification.
  class Help < Service
    HELP = %(
      Olá!

      Para usar o serviço fale "traduza peixe em japonês"
    )

    def call
      HELP
    end
  end
end
