require_relative "lib/Board"

class Game
  attr_reader :board

  def initialize
    @board = Board.new
  end
end

g = Game.new
binding.pry
