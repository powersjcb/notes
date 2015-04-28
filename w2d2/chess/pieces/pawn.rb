require_relative '../piece'

class Pawn < Piece
  attr_reader :symbol

  def initialize(options)
    super(options)
    @symbol = @color == :white ? "\u2659" : "\u265F"
  end

  def moves
    # movement direction, negative is up
    sign = (@color == :white) -1 : 1
    candidate_offset = [[sign, 0], [sign, -1], [sign, 1]]
    # double move, on first movement
    candidate_offset << [2,0] if @moved = false

    candidate_position = []
    candidate_offset.each do |offset|
      dx, dy = offset
      x, y = @position
      candidate_position << [x + dx, y + dy]
    end
    candidate_position
  end
end
