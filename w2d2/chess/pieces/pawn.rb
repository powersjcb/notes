require_relative '../piece'

class Pawn < Piece
  attr_reader :symbol

  def initialize(options)
    super(options)
    @symbol = @color == :black ? "\u2659" : "\u265F"
  end

  def moves
    # movement direction, negative is up
    sign = @color == :white ? -1 : 1
    candidate_offsets = [[sign, 0], [sign, -1], [sign, 1]]
    # double move, on first movement
    candidate_offsets << [(2 * sign), 0] if @moved == false
    candidate_positions = []
    candidate_offsets.each do |offset|
      dx, dy = offset
      x, y = @position
      candidate_position = [x + dx, y + dy]
      if @board.on_board?(candidate_position)
        # cant hit friendly
        if @board.occupied?(candidate_position)
          if @color == @board.piece_at(candidate_position).color
            next
          end
          next unless (dy == 1 || dy == -1) &&
                  @color != @board.piece_at(candidate_position).color
        end
        # must be killing if diag.
      end
      candidate_positions << [x + dx, y + dy]
    end

    candidate_positions
  end
end
