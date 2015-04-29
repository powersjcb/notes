require_relative '../piece'

class Bishop < SlidingPiece
  OFFSETS = [[1, 1], [-1, 1], [1, -1], [-1, -1]]

  def moves
    valid_moves = []
    CARD_DELTAS.each do |offset|
      valid_moves << sliding_limit(@position, offset)
    end

    valid_moves.compact
  end


end
