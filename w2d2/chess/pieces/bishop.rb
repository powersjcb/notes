require_relative '../piece'

class Bishop < SlidingPiece
  OFFSETS = [[1, 1], [-1, 1], [1, -1], [-1, -1]]
  def moves
    # position + all relative offsets
  end


end
