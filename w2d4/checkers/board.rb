require_relative 'piece'

class Board
  attr_reader :grid

  def initialize(options = {})
    @grid = Array.new(8) { Array.new(8) }
    setup_board
  end

  def [](row,col)
    x, y = pos
    @grid[x][y]
  end

  def []=(row, col, val)
    x, y = pos
    @grid[x][y] = val
  end


  def setup_board
    rows = [0, 1, 2, 5, 6, 7]
    rows.each do |row|
      color = (row > 3) ? :white : :black

      (0...8).each do |col|
        place_new_piece(row, col, color) if (col + row).odd?
      end
    end
  end




  def place_new_piece(row, col, color)
    options = {location: [row, col], color: color}
    @grid[row][col] = Piece.new(options)
  end


end


#tests
b = Board.new
b.grid.each do |row|
  display_line = []
  row.each do |space|
    if space.nil?
      display_line << "_"
    else
      display_line << space.symbol
    end
  end
  puts display_line.join("|")
end
