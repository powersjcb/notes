require 'byebug'
class SlidingPiece < Piece
  DIAG_DELTAS = [1, -1, 1, -1].permutation(2).to_a.uniq

  CARD_DELTAS = [[1, 0], [0, 1], [-1, 0], [0, -1]]

  def positions

  end

  def sliding_limit(pos, direction)
    dx, dy = direction
    x, y = pos
    new_pos = [x + dx, y + dy]
    if !@board.on_board?(new_pos) || (@board.occupied?(new_pos) && own_piece?(new_pos) )
      return nil
    end
    return new_pos if @board.occupied?(new_pos) && !own_piece?(new_pos)
    sliding_limit(new_position, direction) + new_pos
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
