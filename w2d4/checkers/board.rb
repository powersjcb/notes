require 'byebug'
require 'colorize'
require_relative 'piece'

class Board
  attr_reader

  def initialize(seed = true)
    @grid = Array.new(8) { Array.new(8) }
    @cursor = [2,3]
    @moves_buffer = []
    @player_color = :red
    seed_grid unless seed == false
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def deep_dup
    new_board = Board.new(false)
    pieces.each do |piece|
      options = {:color => piece.color,           :king => piece.king,
                 :position => piece.position.dup, :board => new_board }
      new_board[piece.position.dup] = Piece.new(options)
    end

    new_board
  end

  def move(moves_array)  # [start_pos, next, next, next]
    # raise
    raise OutOfTurnError if self[moves_array.first].color != @player_color
    raise InvalidInputError if moves_array.count < 2
    self[moves_array.shift].perform_moves(moves_array)

    @player_color = ( @player_color == :red) ? :white : :red
  end

  def on_board?(pos)
    row, col = pos
    row.between?(0,7) && col.between?(0,7)
  end

  def occupied?(pos)
    !self[pos].nil?
  end

  def pieces
    @grid.flatten.compact
  end

  def render
    puts "  0  1  2  3  4  5  6  7"
    8.times do |row|
      raster_line = []
      8.times do |col|
        if @cursor != [row, col] && @moves_buffer.include?([row,col])
          bg_color = :green
        elsif @cursor != [row, col]
          bg_color = (col + row).even? ? :red : :black
        else #cursor position
          bg_color = :light_blue
        end
        item = self[[row,col]]
        if item.nil?
          raster_line << "   ".colorize(:background => bg_color)
        else
          i_color = (item.color == :red) ? :red : :white
          raster_line << " #{item.symbol} ".colorize(color: i_color, :background => bg_color)
        end
      end
      puts "#{row}" + raster_line.join("")
    end
    render_stats
  end

  def render_stats
    color = @player_color == :red ? "Red" : "White"
    puts "#{color}'s move'"
    puts "Cursor location: #{@cursor}"
    puts "Moves selected: #{@moves_buffer}"
  end

  def seed_grid
    rows = [0, 1, 2, 5, 6, 7]
    rows.each do |row|
      color = (row < 3) ? :red : :white
      8.times do |col|
        options = { board: self, position: [row,col], color: color }
        self[[row,col]] = Piece.new(options) if (row + col).odd?
      end
    end
  end

######################
### cursor methods ###
######################

  def add_to_buffer
    @moves_buffer << @cursor.dup
  end

  def clear_buffer
    @moves_buffer = []
  end

  def cursor_up
    @cursor[0] -= 1 if @cursor.first - 1 >= 0
  end

  def cursor_down
    @cursor[0] += 1 if @cursor.first + 1 <= 7
  end

  def cursor_left
    @cursor[1] -= 1 if @cursor.last - 1 >= 0
  end

  def cursor_right
    @cursor[1] += 1 if @cursor.last + 1 <= 7
  end

  def play_buffer
    move(@moves_buffer)
    @moves_buffer = []
  end

end

if __FILE__ == $0
  b = Board.new
  # p b
  # b.move([[2,1],[3,2]])
  # b.move([[3,2],[4,1]])
  # b.move([[1,2],[2,1]])
  # b.move([[2,3],[3,4]])
  b.render
  # b[[5,2]].s([[3,0],[1,2],[0,1]])
  # b.render
  # b.move([[0,1],[1,2]])
  # b.move([[5,0],[3,2]])
  # b.move([[3,2],[2,3]])
  # b.move([[2,3],[0,1]])
  # b.render
  # b.move([[0,1],[1,2]])
  # b.render

  # b.move([0,1],[1,2])
  # b[[5,2]].s!([[3,0],[1,2]])
  # b.move([5,2],[3,0])
end
