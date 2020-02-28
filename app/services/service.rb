# frozen_string_literal: true

# Application's base service class.
class Service
  def self.call(**args, &block)
    new(**args, &block).call
  end
end
