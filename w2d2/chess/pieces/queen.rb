require_relative '../piece'

class Queen < SlidingPiece

  def offsets

  end

  def moves
    valid_moves = []
    CARD_DELTAS.each do |offset|
      valid_moves << sliding_limit(@position, offset)
    end

    valid_moves.compact
  end


end
