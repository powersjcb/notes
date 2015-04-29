class Piece
  attr_reader :symbol, :color
  def initialize(options)
    @color = options[:color]
    @position = options[:position] # = []
    @moved = options[:moved]  # boolean
    @board = options[:board]

    #REMOVE ME
    @symbol = @color == :black ? "\u2659" : "\u265F"

  end
  #
  # def symbol
  #   raise "Not implemented yet"
  # end

  def valid_moves
    # positions
    # checks if on board
    # checks if hitting own piece
    ## not entering check puts you in check
  end

    # returns true if empty or enemy
  def own_piece?(pos)
    return false if @board.piece_at(pos).nil?
    @color == @board.piece_at(pos).color
  end

end
