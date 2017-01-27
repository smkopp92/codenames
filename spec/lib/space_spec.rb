require 'spec_helper'

RSpec.describe Space do
  describe "#new" do
    it "initializes with a word" do
      expect{ Space.new("flamingo") }.to_not raise_error
      expect{ Space.new }.to raise_error
    end
    it "has a writer for color and selected" do
      expect{ Space.new("tortoise").color = "Blue" }.to_not raise_error
      expect{ Space.new("tortoise").selected = true }.to_not raise_error
    end
    it "has a reader for word, color that defaults to nil, and selected that defaults to false" do
      space = Space.new("pine tree")
      expect(space.word).to eq "pine tree"
      expect(space.selected).to eq false
      expect(space.color).to eq nil
    end
  end
end
