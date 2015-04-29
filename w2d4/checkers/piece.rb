class Piece
  def initialize(options = {})
    @location = options[:location]
    @color    = options[:color]
    @king     = false
    @board    = options[:board]
  end

  def moves
    candidates = [[1,1], [1,-1]]
    candidates << [[-1,1], [-1,-1]] if @king == true
    # reject if hits unit, reject if out of bounds
    valid_moves = [ ]
    candidates.each do |pos|
      unless !@board.on_board?(pos) || @board.occupied?(pos)
        valid_moves << pos
      end
    end

    valid_moves
  end

  def symbol
    @color == :white ? "○" : "●" if @king == false
    @color == :white ? "◇" : "◆" if @king == true
  end
end
