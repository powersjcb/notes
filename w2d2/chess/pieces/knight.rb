class Knight < SteppingPiece

  OFFSETS = [[-2, 1], [-2, -1], [-1, 2], [2, 1],
                    [2, -1], [1, 2], [-1, -2], [1, -2] ]


  def initialize(options)
    super(options)
    @symbol = @color == :black ? "\u2658" : "\u265E"
  end

  def offsets
    OFFSETS
  end


end
