require_relative "constants/words"
require_relative "space"
require "pry"

class Board
  def initialize
    generate_board
    assign_colors
  end

  def print_board(reveal = false)
    output = "Red Team Word | ".red + "Blue Team Word | ".blue + "Assassin Word | ".green + "Neutral Word | ".yellow + "Unpicked Word"
    output += "\n " + "-" * (max_length * 5 + 14) + "\n|"
    @board.each_with_index do |row, index|
      row.each_with_index do |space, index|
        space_count = (max_length - space.word.length + 2)/2.0
        output += " " * space_count + space.output(reveal) + " " * space_count.round + "|"
        if index == row.length - 1
          output += "\n"
        end
      end
      output += " " + "-" * (max_length * 5 + 14) + "\n"
      if index != @board.length - 1
        output += "|"
      end
    end
    output
  end

  private

  def generate_board
    words = WORDS.sample(25)
    @board = []
    5.times do |i|
      row = []
      5.times do |j|
        row << Space.new(words[i+j*5])
      end
      @board << row
    end
  end

  def assign_colors
    reds = [8,9].sample
    blues = 17 - reds
    assign(reds,"Red")
    assign(blues,"Blue")
    assign(1,"Black")
  end

  def assign(amount,color)
    while amount > 0
      space = random_space
      if space.color.nil?
        space.color = color
        amount -= 1
      end
    end
  end

  def random_space
    @board.sample.sample
  end

  def max_length
    max_rows = @board.map{ |row| row.max_by{ |space| space.word.length } }
    max_rows.max_by{ |space| space.word.length }.word.length
  end
end
