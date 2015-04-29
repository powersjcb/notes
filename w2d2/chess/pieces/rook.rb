class Rook < SlidingPiece
  # OFFSETS = [[0, 1], [0, 1], [1, 0], [-1, 0]]
  def initialize(options)
    super(options)
    @symbol = @color == :black ? "\u2656" : "\u265C"
  end


  def moves
    valid_moves = []
    CARD_DELTAS.each do |offset|
      valid_moves << sliding_limit(@position, offset)
    end

    valid_moves#.compact
  end


end
