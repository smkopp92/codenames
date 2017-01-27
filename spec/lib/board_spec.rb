require 'spec_helper'

RSpec.describe Board do
  describe "#new" do
    let(:board) { Board.new }
    it "creates an array of arrays of non-selected spaces" do
      expect(board.board).to be_collection_of Array
      board.board.each do |row|
        expect(row).to be_collection_of Space
        row.each do |space|
          expect(space.selected).to eq false
        end
      end
    end

    it "randomly assigns 8/9 red and 9/8 blue spaces and one black space" do
      colors = board.board.map { |row| row.map { |space| space.color } }.flatten
      red_count = colors.select { |color| color == "Red" }.count
      blue_count = colors.select { |color| color == "Blue" }.count
      black_count = colors.select { |color| color == "Black" }.count
      expect(red_count).to be >= 8
      expect(blue_count).to be >= 8
      expect(red_count).to be <= 9
      expect(blue_count).to be <= 9
      expect(red_count).to_not eq blue_count
      expect(black_count).to eq 1
    end
  end
end
