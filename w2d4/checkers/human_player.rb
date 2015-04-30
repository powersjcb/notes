require_relative 'invalid_input_error'

class HumanPlayer

  def initialize(options = {})
    options = {:name => "Player 1"}.merge(options)
    @name  = options[:name]
    @board = options[:board]
  end

  def cursor_select
    done_selecting = false
    @board.clear
    #clear buffer

    until done_selecting
      case read_char
      when "\e[A"   # up arrow
        @board.cursor_up
      when "\e[B"   # down arrow
        @board.cursor_up
      when "\e[C"   # right
      when "\e[D"   # left
      when " "      # space, add to buffer
      when "\r"     # on hitting enter
        done_selecting = true
      when "\u0003" # exit on ctr + c
        "Thank you for playing"
        exit
      end
    end
    # output buffer
  end


  def read_char
    STDIN.echo = false
    STDIN.raw!

    input = STDIN.getc.chr
    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil
      input << STDIN.read_nonblock(2) rescue nil
    end
  ensure
    STDIN.echo = true
    STDIN.cooked!

    return input
  end

end
