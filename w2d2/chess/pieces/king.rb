class King < SteppingPiece
  def moves
    # position + all relative offsets
    candidate_offset = [-1, 0, 1].permutation(2).to_a

    candidate_positions = []
    candidate_offset.each do |offset|
      dx, dy = offset
      x, y = @position
      candidate_positions << [x + dx, y + dy]
    end

    candidate_positions

    # Test for validity
  end
end
