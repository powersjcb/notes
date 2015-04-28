require_relative 'piece_requirements'

class Board



  STARTING_POSITIONS = {
    :r => [0,0],
    :kn => [0,1],
    :b => [0,2],
    :q => [0,3],
    :k => [0,4],
    :b => [0,5],
    :kn => [0,6],
    :r => [0,7],
    :p => [1,0],
    :p => [1,1],
    :p => [1,2],
    :p => [1,3],
    :p => [1,4],
    :p => [1,5],
    :p => [1,6],
    :p => [1,7]}


  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    seed_board(:black)
    #seed_board(:white)
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def seed_board
    [1,6].each do |row|
      8.times do |col|
        color = (row == 1) ? :black : :white
        options = { }
        Pawn.new(options)
      end
    end
  end

  def self.deep_dup

  end

  def on_board?#(position)

  end

  def occupied?(position)

  end

  def piece_at(position)

  end

  def checkmate?(color)

  end

  def check?(color)

  end



end



board = Board.new
p board.grid
