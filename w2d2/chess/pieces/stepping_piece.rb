class SteppingPiece < Piece

  def moves
    candidate_positions = []
    offsets.each do |offset|
      dx, dy = offset
      x, y = @position
      pos = [x + dx, y + dy]

      unless own_piece?(pos) || !@board.on_board?(pos)
        candidate_positions << pos
      end
    end

    candidate_positions
  end

  def valid_moves

    super
  end

end
