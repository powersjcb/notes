require_relative 'invalid_input_error'
require_relative 'keypress'

class HumanPlayer
  extend Keypressable

  attr_reader :color

  def initialize(options = {})
    options = {:name => "Player 1"}.merge(options)
    @name  = options[:name]
    @board = options[:board]
    @colro = options[:color]
  end

  def cursor_select
    done_selecting = false

    until done_selecting
      system('clear')
      @board.render

      case HumanPlayer.read_char
      when "\e[A"   # up arrow
        @board.cursor_up
      when "\e[B"   # down arrow
        @board.cursor_down
      when "\e[C"   # right
        @board.cursor_right
      when "\e[D"   # left
        @board.cursor_left
      when " "      # space, add to buffer
        @board.add_to_buffer
      when "\r"     # on hitting enter
        @board.play_buffer

        done_selecting = true
      when "\u0003" # exit on ctr + c
        "Thanks for playing"
        exit
      end
    end
  end
end
