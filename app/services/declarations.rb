# frozen_string_literal: true

# Contains the services declarations and autoloads for all their classes.

# Revolve actions of users received from DialogFlow.
module ActionResolver
  dir = File.join(__dir__, 'action_resolver')

  autoload('Help', File.join(dir, 'help.rb'))
end
