require 'byebug'
require 'colorize'
require_relative 'piece_requirements'

class Board

  KLASSES = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

  attr_reader :grid, :position

  def initialize(seed = true)
    @grid = Array.new(8) { Array.new(8) }
    seed_board if seed == true
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def deep_dup
    new_board = Board.new(false)
    @grid.flatten.compact.each do |piece|
      new_pos = piece.position
      options = { position: new_pos.dup, color: piece.color,
                            moved: piece.moved, board: new_board }
      new_board[new_pos] = piece.class.new(options)
    end

    new_board
  end

  def seed_board
    # #seed pawns
    [1,6].each do |row|
      8.times do |col|
        pos = [row, col]
        color = (row == 1) ? :black : :white
        options = { color: color, position: pos,
                    board: self, moved: false }
        self[pos] = Pawn.new(options)
      end
    end
    #seed others
    [0,7].each do |row|
      KLASSES.each.with_index do |klass, col|
        pos = [row, col]
        color = (row == 0) ? :black : :white
        options = { color: color, position: pos,
                    board: self, moved: false }
        self[pos] = klass.new(options)
      end
    end
  end

  def pieces
    @grid.flatten.compact
  end

  def move(p1, p2)
    if self[p1].valid_move(p2)
      if !self[p1].move_into_check?(p2)
        move!(p1, p2)
      else
        raise CheckError
        puts "can't make a move into check"
      end
    else
      raise InvalidMoveError
      puts "invalid move"
    end
  end

  def move!(p1, p2)
    self[p2] = self[p1]
    self[p2].position = p2
    self[p2].moved = true
    self[p1] = nil
  end


  def on_board?(position)
    row, col = position
    row.between?(0,7) && col.between?(0,7)
  end

  def occupied?(position)
    !piece_at(position).nil?
  end

  def piece_at(position)
    self[position]
  end

  def checkmate?(color)
    return false unless check?(color)

    pieces.select { |piece| piece.color == color }.all? do |piece|
      piece.valid_moves.empty?
    end
  end

  def check?(color)
    king_pos = find_king(color).position
    pieces.any? do |piece|
      piece.moves.include?(king_pos)
    end
  end

  def find_king(color)
    pieces.find do |el|
      el.is_a?(King) && el.color == color
    end
  end

  def render
    @grid.each.with_index do |row, i|
      display_line = ["#{8-i}"]
      row.each.with_index do |space, j|
        bg_color = (i+j).odd? ? :blue : :red
        if space.nil?
          display_line << "   ".colorize(background: bg_color)
        else
          display_line << " #{space.symbol} ".colorize(background: bg_color)
        end
      end
      puts display_line.join("")
    end
    puts "  a  b  c  d  e  f  g  h"
    puts "CHECKMATE BLACK" if checkmate?(:black)
    puts "CHECKMATE WHITE" if checkmate?(:white)
  end
end


if __FILE__ == $0
#
  b = Board.new
  b.move([6,5],[5,5])
  b.move([1,4],[3,4])
  b.move([6,6],[4,6])
  b.move([0,3],[4,7])
  b.render
  p b.checkmate?(:white)
  p b.checkmate?(:black)

  # f2, f3
  # e7, e5
  # g2, g4
  # d8, h4


p b.piece_at([6,7]).moves

  # b.pieces.each do |piece|
  #   p piece.position if !piece.valid_moves.empty? && piece.color == :white
  #   p piece.valid_moves if piece.color == :white && !piece.valid_moves.empty?
  # end
  # b.render
  # b.grid[0][0].move(b, [5,4])
  # b.render
# p b.check?(:white)
#
# # puts c.grid
end
