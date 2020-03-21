# frozen_string_literal: true

# Natural language interpreter API.
module DialogFlow
  dir = File.join(__dir__, 'dialog_flow')

  autoload('ActionParser', File.join(dir, 'action_parser.rb'))
  autoload('Fullfilment', File.join(dir, 'fullfilment.rb'))
end
