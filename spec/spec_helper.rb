require 'pry'

require_relative '../lib/board'
require_relative '../lib/space'

RSpec::Expectations.configuration.on_potential_false_positives = :nothing

RSpec::Matchers.define :be_collection_of do |expected|
  match do |actual|
    actual.each do |component|
      expect(component).to be_a expected
    end
  end
end
