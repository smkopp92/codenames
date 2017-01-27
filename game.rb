require_relative "lib/Board"

class Game
  attr_reader :board

  def initialize
    @board = Board.new
    @is_playing = true
    # @starting_team = @board.find_starting_team
  end

  def play_game
  end
end

g = Game.new
puts g.board.print_board
