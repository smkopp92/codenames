require "colorize"

class Space
  attr_reader :word
  attr_accessor :color, :selected

  def initialize(word)
    @word = word
    @color = nil
    @selected = false
  end

  def output(reveal = false)
    if selected || reveal
      if color == "Red"
        word.red
      elsif color == "Blue"
        word.blue
      elsif color == "Black"
        word.green
      else
        word.yellow
      end
    else
      word
    end
  end
end
