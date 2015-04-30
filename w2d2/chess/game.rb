require_relative 'board.rb'

class Game

  def initialize
    @board = Board.new
  end

  def play

    puts "Welcome to chess!"

    loop  do
      render
      accept_input
    end

  end

  def render
    @board.render
    # puts "#{color} player's turn."
  end

  def accept_input
    debugger
    # begin
      # puts "Player #{player} turn. Input starting position as '0, 0'"
      start_pos = gets.chomp.split(",").map(&:to_i)
      # puts "Player #{player} turn. Input ending position as '0, 0'"
      end_pos   = gets.chomp.split(",").map(&:to_i)
      row, col = start_pos
      piece = @board.grid[row][col]

      piece.move(@board, end_pos)
    # rescue InvalidMoveError
    #   puts "invalid input, try again"
    # end
  end
end

Game.new.play
