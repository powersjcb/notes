require_relative '../piece'

class Pawn < Piece
  attr_reader :symbol

  def initialize(options)
    super(options)
    @symbol = @color == :white ? "\u2659" : "\u265F"
  end

  def moves
    # position + all relative offsets
  end
end
