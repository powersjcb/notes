class Knight < SteppingPiece
  def moves
    # position + all relative offsets

    candidate_offsets = [[-2, 1], [-2, -1], [-1, 2], [2, 1],
                        [2, -1], [1, 2], [-1, -2], [1, -2] ]

    candidate_positions = []
    candidate_offsets.each do |offset|
      dx, dy = offset
      x, y = @position
      candidate_positions << [x + dx, y + dy]
    end

    candidate_positions


  end
end
