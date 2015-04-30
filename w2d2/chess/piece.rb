class Piece

  attr_reader :symbol, :color
  attr_accessor :position, :moved

  def initialize(options)
    @color = options[:color]
    @position = options[:position] # = []
    @moved = options[:moved]  # boolean
    @board = options[:board]
  end

  def move_into_check?(p2)
    checking_board = @board.deep_dup
    p1 = @position
    checking_board.move!(p1, p2)
    checking_board.check?(@color)
  end

  def own_piece?(pos)  # returns true if empty or enemy
    return false if @board.piece_at(pos).nil?
    @color == @board.piece_at(pos).color
  end

  def valid_move(pos)
    valid_moves.include?(pos)
  end

  def valid_moves
    moves.reject { |move| move_into_check?(move) }
  end

end
