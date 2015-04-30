require 'byebug'

require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'

class Game



  def initialize
    @board = Board.new
    @player1 = HumanPlayer.new("Player 1")
    @player2 = HumanPlayer.new("Player 2")
  end

  def play
    puts "Welcome to chess!"
    turn = 1
    until @board.checkmate?(:black) || @board.checkmate?(:white)
      render
      accept_input(turn)

      turn += 1
    end
  end

  def render
    @board.render
  end

  def accept_input(turn)
    begin
      player = turn.odd? ? @player1 : @player2
      start_pos, end_pos = player.provide_input
      puts start_pos
      start_pos = translate_input(start_pos)
      end_pos = translate_input(end_pos)
      @board.move(start_pos, end_pos)

    rescue InvalidMoveError, InvalidUserInput
      retry
      puts "invalid input, try again"
    rescue CheckError
      retry
      puts "Invalid move, can't put self in check"
    end
  end


  def translate_input(chess_code)
    row, col = chess_code.split("")
    unless !!/^[1-8]$/.match(col) && !!/^[a-h,A-H]$/.match(row)
      raise InvalidUserInput
    end
    row = 8 - row.to_i
    col = (col.downcase.ord - "a".ord)
    grid_pos = [col, row]

    grid_pos
  end
end


if __FILE__ == $0
  # if ARGV.shift == "interactive"
  Game.new.play
end
