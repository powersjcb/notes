require_relative 'board.rb'

class Game

  def initialize
    @board = Board.new
    @player1 = HumanPlayer.new
    @player2 = HumanPlayer.new
  end

  def play
    debugger
    puts "Welcome to chess!"
    turn = 1
    until @board.checkmate?(:black)# || @board.checkmate?(:white)
      render
      @player1.play_turn if turn.odd?
      @player2.play_turn if turn.even?
      turn += 1
    end
  end

  def render
    @board.render
  end

  def accept_input
  end
end

class HumanPlayer
  def play_turn
    begin
      # puts "Player #{player} turn. Input starting position as '0, 0'"
      start_pos = gets.chomp.split(",").map(&:to_i)
      # puts "Player #{player} turn. Input ending position as '0, 0'"
      end_pos   = gets.chomp.split(",").map(&:to_i)
      row, col = start_pos
      piece = @board.grid[row][col]

      piece.move(@board, end_pos)
    rescue InvalidMoveError
      puts "invalid input, try again"
    end
  end
end

Game.new.play
