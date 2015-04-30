require 'byebug'
class SlidingPiece < Piece
  DIAG_DELTAS = [1, -1, 1, -1].permutation(2).to_a.uniq

  CARD_DELTAS = [[1, 0], [0, 1], [-1, 0], [0, -1]]

  def sliding_limit(pos, direction)
    dx, dy = direction
    x, y = pos
    byebug if x.nil? || y.nil?
    pos = [x + dx, y + dy]

    directional_moves = []
    loop do
      break if !@board.on_board?(pos) || (@board.occupied?(pos) && own_piece?(pos))
      directional_moves << pos
      break if @board.occupied?(pos) && !own_piece?(pos)

      x, y = pos
      pos = [x + dx, y + dy]
    end

    directional_moves
  end

  def moves
    raise "Not implemented"
  end

  def valid_moves
    super
  end

  def check_tile
    # enemy?
    # friendly?
    # empty?
    # off the board?
  end

end
