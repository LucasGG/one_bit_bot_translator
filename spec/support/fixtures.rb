# frozen_string_literal: true

module FixtureHelper
  DIRECTORY = 'spec/fixtures/'

  def metaclass
    class << self; self; end
  end

  def metafixture(filename)
    name, content = load(filename)
    metaclass.define_method(name) { content }
  end

  def fixture(filename)
    name, content = load(filename)
    define_method(name) { content }
  end

  def load(filename)
    [
      File.basename(filename, '.json'),
      JSON.parse(File.read("#{DIRECTORY}#{filename}"))
    ]
  end
end

RSpec.configure { |config| config.extend FixtureHelper }
