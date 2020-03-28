# frozen_string_literal: true

module FixtureHelper
  DIRECTORY = 'spec/fixtures/'

  def metaclass
    class << self; self; end
  end

  def fixture(json_file_name)
    name = File.basename(json_file_name, '.json')
    content = JSON.parse(File.read("#{DIRECTORY}#{json_file_name}"))
    metaclass.define_method(name) { content }
  end
end

RSpec.configure { |config| config.extend FixtureHelper }
