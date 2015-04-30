require 'byebug'
require_relative '../piece'

class Pawn < Piece

  def initialize(options)
    super(options)
    @symbol = @color == :black ? "\u2659" : "\u265F"
  end

  def offsets
    sign = @color == :white ? -1 : 1
    candidate_offsets = [[sign, 0], [sign, -1], [sign, 1]]
    candidate_offsets << [(2 * sign), 0] if @moved == false

    candidate_offsets
  end

  def moves
    valid_moves = []
    offsets.each do |offset|
      row_o, col_o = offset
      row, col = @position
      pos = [row + row_o, col + col_o]

      next if !@board.on_board?(pos) # not on board
      next if (col_o == 0) && @board.occupied?(pos) # moving forward occupied spot
      next if (row_o == 2) && @board.occupied?([row+1, col])
      next if (col_o == 1 || col_o == -1) && !@board.occupied?(pos) && own_piece?(pos) # diag/occupied
      valid_moves << pos
    end

    valid_moves
  end
end
