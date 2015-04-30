class King < SteppingPiece

  OFFSETS = [[1, 0], [0, 1], [-1, 0], [0, -1],
            [1, -1], [1, 1], [-1, 1], [-1, -1]]

  def initialize(options)
    super(options)
    @symbol = @color == :black ? "\u2654" : "\u265A"
  end

  def offsets
    OFFSETS
  end
end
