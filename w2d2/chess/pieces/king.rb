class King < SteppingPiece

  OFFSETS = [-1, 0, 1].permutation(2).to_a

  def initialize(options)
    super(options)
    @symbol = @color == :black ? "\u2654" : "\u265A"
  end

  def offsets
    OFFSETS
  end
end
