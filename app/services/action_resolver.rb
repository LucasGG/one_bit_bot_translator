# frozen_string_literal: true

# Revolve intents of users.
# Prepared for use on controllers.
# Purpose: Disengage external service logic from controllers.
module ActionResolver
  dir = File.join(__dir__, 'action_resolver')

  autoload('Help', File.join(dir, 'help.rb'))
  autoload('Interpret', File.join(dir, 'interpret.rb'))
  autoload('Translate', File.join(dir, 'translate.rb'))
end
