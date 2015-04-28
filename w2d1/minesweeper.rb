require 'byebug'
require 'yaml'

class Game

  def self.load(file)
    YAML.load_file(file)
  end

  def initialize
    @game_over = false
  end

  def play
    until @board.won? || @game_over
      input = get_input
      parse_input(input)
      display
    end
    game_over_msg
  end

  def run
    setup
    size = get_board_size
    mines = get_mines_number
    @board = Board.new(size, mines)
    play
  end

  def toggle_flag(coords)
    @board.toggle_flag(coords)
  end

  def reveal(coords)
    @board.reveal(coords)
  end

  def display
    @board.rows.each_with_index do |row, x|
      raster = []
      row.each_with_index do |tile, y|
        raster << parse_tile(tile, x, y)
      end
      puts raster.join("  ")
    end
  end

  private

  def parse_input(input)
    case input.first
    when "r"
      @game_over = true unless reveal(input.drop(1))
    when "f"
      toggle_flag(input.drop(1))
    when "s"
      save_game(input[1])
    end
  end

  def save_game(filename)
    File.open(filename, 'w') do |f|
      f.puts self.to_yaml
    end
  end

  def setup
    puts "Welcome to Minesweeper! How big of a grid do you want to play in?"
  end

  def get_board_size
    puts "Enter a number:"
    size = Integer(gets.chomp)
  end

  def get_mines_number
    puts "How many mines do you want?"
    mines_number = Integer(gets.chomp)
  end

  def get_input
    puts "Enter in whether you want to Flag (f) or Reveal (r) a spot, or just "\
    "(s) if you want to save the game, and then your filename."
    puts "Format: \'f 4, 5\' or \'r 5, 7\' or \'s\ <filename>'"
    input = gets.chomp.split(',').join(' ').downcase.split
    if input.first == "s"
      return ["s", input.last, nil]
    end
    operation, x, y = input
    if input.length != 3 || (operation != "r" && operation != "f")
      raise InputError
    end
    x = Integer(x)
    y = Integer(y)
    if !@board.valid_tile?([x, y])
      raise InputError
    else
      return [operation, x, y]
    end

  rescue
    puts "Invalid entry. Try again."
    retry
  end

  def game_over_msg
    puts @board
    puts "\n\n"
    puts @game_over ? "You lost!" : "You won!"
  end

  def parse_tile(tile, x, y)
    if @board.flags.include?([x,y])
      "F"
    elsif @board.shown.include?([x,y])
      tile.neighbors == 0 ? "." : tile.neighbors.to_s
    elsif tile.mine && @game_over
      "X"
    else
      "_"
    end
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
  attr_accessor :flags, :shown, :rows

  FOUR_D_DIFFS = [-1, 0, 1, 0].zip([0, 1, 0, -1])


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

    return false if self[x,y].mine

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


  def make_square(x, y)
    potential_neighbors = []
    (x - 1..x + 1).each do |x|
      (y - 1..y + 1) .each do |y|
        potential_neighbors << [x, y]
      end
    end
    potential_neighbors.select! do |coords|
      valid_tile?(coords) && coords != [x, y]
    end
  end


 # private


 def deep_dup(array)
   array.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
 end

  # def fan_out
  #   p @shown
  #   deep_dup(@shown).each do |x,y|
  #     puts
  #     FOUR_D_DIFFS.each do |dx, dy|
  #       puts
  #       coords = [x + dx, y + dy]
  #       if valid_tile?(coords) && !self[*coords].mine &&
  #                                 !@shown.include?(coords)
  #         puts "fan4"
  #         @shown << coords
  #       end
  #     end
  #   end
  # end

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

  def splash(x, y)
  #  debugger
    # if !self[x,y].mine && !@shown.include?([x, y]) && self[x,y].neighbors > 1
      # @shown << [x, y]
    # end
    @shown << [x,y] if self[x,y].neighbors > 0 && !@shown.include?([x,y])
    return [] if @shown.include?([x,y]) #|| self[x,y].neighbors > 0
    reveals = []
    FOUR_D_DIFFS.each do |dx, dy|
      if valid_tile?([x+dx, y+dy]) && !@shown.include?([x+dx, y+dy])
        p "#{[x + dx]} #{[y + dy]}"
        neighbor = [self[x+dx, y+dy], [x+dx, y+dy]]
        if !neighbor.first.mine #neighbor.first.neighbors == 0
          reveals << neighbor
          @shown << [x, y]
        end
      end
    end

    reveals.each do |tneighbor|
      # p "Further splashing #{tneighbor.last}"
      # p @shown
      further_splash = splash(*tneighbor.last)
      @shown += further_splash.map(&:last) unless further_splash.empty?
      reveals += further_splash
    end
    reveals #.map(&:last)
  end
end

if __FILE__ == $0
  if ARGV[0]
    my_game = Game.load(ARGV.shift)
    ARGV = []
    my_game.play
  else
    Game.new.run
  end
  # Game.load("file2.txt").play
end
# Game.new.play
