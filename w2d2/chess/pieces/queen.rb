require_relative '../piece'

class Queen < SlidingPiece

  def initialize(options)
    super(options)
    @symbol = @color == :black ? "\u2655" : "\u265B"
  end

  def moves
    valid_moves = []
    (CARD_DELTAS + DIAG_DELTAS).each do |offset|
      valid_moves += sliding_limit(@position, offset)
    end

    valid_moves
  end


end
