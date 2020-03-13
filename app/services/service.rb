# frozen_string_literal: true

# Application's base service class.
class Service
  def self.call(...)
    new(...).call
  end
end

require_relative 'declarations'
