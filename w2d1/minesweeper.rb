require 'byebug'

class Game
  def initialize
    @game_over = false
  end

  def play
    setup
    size = get_board_size
    mines = get_mines_number
    @board = Board.new(size, mines)
    until @board.won? || @game_over
      input = get_input

      case input.first
      when "r"
        @game_over = true unless reveal(input.drop(1))
      when "f"
        toggle_flag(input.drop(1))
      end

      display
    end
    game_over_msg
  end

  def toggle_flag(coords)
    @board.toggle_flag(coords)
  end

  def reveal(coords)
    @board.reveal(coords)
  end

  def display
    @board
  end

  private

  def setup
    puts "Welcome to Minesweeper! How big of a grid do you want to play in?"
    puts "Enter a number:"
  end

  def get_board_size
    size = Integer(gets)
  end

  def get_mines_number
    mines_number = Integer(gets)
  end

  def get_input
    puts "Enter in whether you want to Flag (f) or Reveal (r) a spot."
    puts "Format: \'f 4, 5\' or \'r 5, 7\'"
    input = gets.chomp.split(',').join(' ').downcase.split
    operation, x, y = input
    if input.length != 3 || (operation != "r" && operation != "f")
      raise InputError
    end
    x = Integer(x)
    y = Integer(y)
    if !@board.valid_tile?(x, y)
      raise InputError
    else
      return [operation, x, y]
    end

  rescue
    puts "Invalid entry. Try again."
    retry
  end

  def game_over_msg
    puts @game_over ? "You lost!" : "You won!"
  end


end

class Tile
  attr_accessor :neighbors, :mine
  def initialize
    @mine  = false
    @neighbors = 0
  end

  def to_s
    @mine ? "@" : "_"
  end


end

class Board
  attr_accessor :flags, :shown

  def initialize(size = 9, mines_no = 9)
    @rows = Array.new(size) { Array.new(size) { Tile.new } }
    @flags = []
    @shown = []
    @mines_number = mines_no
    seed_board(@mines_number)
  end

  def [](x, y)
    @rows[x][y]
  end

  def []=(x, y, val)
    @rows[x][y] = val # tile assignement
  end

  def reveal(coords)
    x, y = coords

    return false if @rows[x,y].mine

    @shown << [x,y] if splash(x,y) == []
    @shown.uniq!
    true
  end

  def toggle_flag(coords)
    if @shown.include?(coords)
      false
    elsif @flags.include?(coords)
      @flags.delete(coords)
      true
    else
      @flags << coords
      true
    end
  end

  def seed_board(mines_no)
    mines = []
    until mines.size == (mines_no)
      mines << [rand(@rows.size), rand(@rows.size)]
      mines.uniq!
    end
    mines.each { |x, y| self[x, y].mine = true }
    initialize_tiles
    self
  end

  def to_s
    string = ""
    @rows.each do |row|
      row.each do |mine|
        if mine.mine
          string += mine.to_s
        else
          string += mine.neighbors == 0 ? "." : mine.neighbors.to_s
        end
        string += "  "
      end
      string += "\n"
    end
    string
  end

  def won?
    @shown.count + @mines_number == @rows.length*@rows.first.length &&
      @flags.count == @mines_number
  end

  def valid_tile?(coord)
    x, y = coord
    x.between?(0, @rows.size - 1) && y.between?(0, @rows.size - 1)
  end

#  private

  def initialize_tiles
    @rows.each_with_index do |row, x|
      row.each_with_index do |tile, y|
        potential_neighbors = make_square(x, y)
        #elements in that 3x3 square have a mine?
        potential_neighbors.select! { |coords| self[*coords].mine }
        #if they do, increment the neighbors
        self[x, y].neighbors = potential_neighbors.count
      end
    end
  end

  def make_square(x, y)
    potential_neighbors = []
    (x - 1..x + 1).each do |x|
      (y - 1..y + 1) .each do |y|
        potential_neighbors << [x, y]
      end
    end
    potential_neighbors.select! do |coords|
      valid_tile?(*coords) && coords != [x, y]
    end
  end

  def splash(x, y)
  #  debugger
    return [] if @shown.include?([x,y]) || self[x,y].neighbors > 0
    reveals = []
    splash_offset = [-1, 0, 1, 0].zip([0, 1, 0, -1])
    splash_offset.each do |dx, dy|
      if valid_tile?([x+dx, y+dy]) && !@shown.include?([x+dx, y+dy])
        neighbor = [self[x+dx, y+dy], [x+dx, y+dy]]
        if neighbor.first.neighbors == 0
          reveals << neighbor
          @shown << [x, y]
        end
      end
    end

    reveals.each do |tneighbor|
      p "Further splashing #{tneighbor.last}"
      p @shown
      further_splash = splash(*tneighbor.last)
      @shown += further_splash.map(&:last) unless further_splash.empty?
      reveals += further_splash
    end
    reveals #.map(&:last)
  end
end

load 'minesweeper.rb'
a = Board.new(13, 13)
puts a
