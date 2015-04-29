class Piece

  attr_reader :symbol, :color, :position, :moved

  def initialize(options)
    @color = options[:color]
    @position = options[:position] # = []
    @moved = options[:moved]  # boolean
    @board = options[:board]
  end

  def move_into_check?(pos)
    checking_board = board.deep_dup
    move!(checking_board, pos)
    king_pos = checking_board.pieces.find { |el| el.is_a?(King) }.position

    checking_board.pieces.any? do |piece|
      piece.moves.include?(king_pos)
    end
  end




  # !move_into_check?(pos)

  def move(board, pos)
    move!(board,pos) if valid_move(pos)
  end

  def move!(board, pos)
    row, col = pos
    board.grid[row][col] = self
    r_old, c_old = @position
    board.grid[r_old][c_old] = nil
  end

  def valid_move(pos)
    moves.include?(pos)
  end

    # returns true if empty or enemy
  def own_piece?(pos)
    return false if @board.piece_at(pos).nil?
    @color == @board.piece_at(pos).color
  end

end


# valid = candidates.reject { |move| move_into_check?(move) }
