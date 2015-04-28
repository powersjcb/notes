class SteppingPiece < Piece
  OFFSETS = [-1, 0, 1].permutation(2).to_a
  def moves
    # position + all relative offsets
  end

  def valid_moves

    super
  end

end
