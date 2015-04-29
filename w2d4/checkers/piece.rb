class Piece
  def initialize(options = {})
    @location = options[:location]
    @color    = options[:color]
    @king     = false
  end

  def symbol
    @color == :white ? "○" : "●" if @king == false
    @color == :white ? "◇" : "◆" if @king == true
  end

  def moves

  end
end
