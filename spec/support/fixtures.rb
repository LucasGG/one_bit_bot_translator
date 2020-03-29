# frozen_string_literal: true

module FixtureHelper
  DIRECTORY = 'spec/fixtures/'

  def metaclass
    class << self; self; end
  end

  def metafixture(filename, parse = true)
    name, content = load(filename, parse)
    metaclass.define_method(name) { content }
  end

  def fixture(filename, parse = true)
    name, content = load(filename, parse)
    define_method(name) { content }
  end

  def load(filename, parse_the_content)
    if parse_the_content
      [
        File.basename(filename, '.json'),
        JSON.parse(File.read("#{DIRECTORY}#{filename}"))
      ]
    else
      [
        File.basename(filename, '.json'),
        File.read("#{DIRECTORY}#{filename}")
      ]
    end
  end
end

RSpec.configure { |config| config.extend FixtureHelper }
