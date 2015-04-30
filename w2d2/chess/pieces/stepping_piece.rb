class SteppingPiece < Piece

  def moves #excludes check
    candidate_positions = []
    offsets.each do |offset|
      dx, dy = offset
      x, y = @position
      pos = [x + dx, y + dy]

      unless !@board.on_board?(pos) || own_piece?(pos)
        candidate_positions << pos
      end
    end

    candidate_positions
  end


end
