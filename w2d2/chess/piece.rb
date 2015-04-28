class Piece
  def initialize(options = {moved: false})
    @color = options[:color]
    @position = options[:position] # = []
    @moved = options[:moved]  # boolean
    @board = options[:board]
  end
  #
  # def symbol
  #   raise "Not implemented yet"
  # end

  def valid_moves
    positions
    # checks if on board
    # checks if hitting own piece
    # kills if hits enemy
    ## not entering check puts you in check
  end

end
