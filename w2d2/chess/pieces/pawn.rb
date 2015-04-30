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
      dx, dy = offset
      x, y = @position
      pos = [x + dx, y + dy]
      next if !@board.on_board?(pos) # not on board
      next if (dy == 0) && @board.occupied?(pos) # moving forward occup
      next if (dy == 1 || dy == -1) && !@board.occupied?(pos) && own_piece?(pos) # diag/occupied
      valid_moves << [x + dx, y + dy]
    end

    valid_moves
  end
end
