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
      @board.move(start_pos, end_pos)

    rescue InvalidMoveError
      puts "invalid input, try again"
    rescue CheckError
      puts "Invalid move, can't put self in check"
    end
  end


  def translate_input(chess_code)
    row = 
    col =

    grid_pos = [row, col]
  end
end


if __FILE__ == $0
  # if ARGV.shift == "interactive"
  Game.new.play
end
