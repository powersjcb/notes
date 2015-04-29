require_relative '../piece'

class Bishop < SlidingPiece

  def initialize(options)
    super(options)
    @symbol = @color == :black ? "\u2657" : "\u265D"
  end

  def moves
    valid_moves = []
    DIAG_DELTAS.each do |offset|
      valid_moves += sliding_limit(@position, offset)
    end

    valid_moves
  end


end
