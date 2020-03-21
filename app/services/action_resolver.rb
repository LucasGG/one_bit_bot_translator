# frozen_string_literal: true

# Revolve actions of users received from DialogFlow.
module ActionResolver
  dir = File.join(__dir__, 'action_resolver')

  autoload('Help', File.join(dir, 'help.rb'))
  autoload('Interpret', File.join(dir, 'interpret.rb'))
  autoload('Translate', File.join(dir, 'translate.rb'))
end
