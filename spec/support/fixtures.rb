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
    leaded = [File.basename(filename, '.json')]
    leaded << if parse_the_content
                JSON.parse(File.read("#{DIRECTORY}#{filename}"))
              else
                File.read("#{DIRECTORY}#{filename}")
              end
  end
end

RSpec.configure { |config| config.extend FixtureHelper }
