require 'byebug'
require_relative '../piece'

class Pawn < Piece
  attr_reader :symbol

  def initialize(options)
    super(options)
    @symbol = @color == :black ? "\u2659" : "\u265F"
  end

  def offsets
    # movement direction, negative is up
    sign = @color == :white ? -1 : 1
    candidate_offsets = [[sign, 0], [sign, -1], [sign, 1]]
    # double move, on first movement
    candidate_offsets << [(2 * sign), 0] if @moved == false

    candidate_offsets
  end

  def moves
    valid_moves = []
    self.offsets.each do |offset|
      dx, dy = offset
      x, y = @position
      pos_location = [x + dx, y + dy]
      next if !@board.on_board?(pos_location) # not on board
      next if self.own_piece?(pos_location)   # not enemy or nil
      next if (dy == 1 || dy == -1) && !@board.occupied?(pos_location) #diag/occupied
      valid_moves << [x + dx, y + dy]
    end

    valid_moves
  end
end
