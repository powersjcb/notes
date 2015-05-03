require_relative 'deck'


class Tableau

  FOUNDATIONS =  {0 => "  ♥",
                  1 => "  ♠",
                  2 => "  ♦",
                  3 => "  ♣"}

  attr_reader :piles

  def initialize(seed = true)
    @piles = Array.new(16) { [] }
    seed_board if seed
    # piles       rows 0..7
    # freecells   rows 8..11
    # foundations rows 12..15
  end

  def [](pos)
    row, col = pos
    @piles[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @piles[row][col] = val
  end

  def cards
    @piles.flatten.compact
  end

  def deep_dup
  end

  def free_cells
    @piles.take(12).count(&:empty) # excludes foundations
  end

  def max_pile_size
    @piles.max(&:count).count
  end

  def move(p1, p2)
    unless piles[p1].moves.include?(p2)
      raise InvalidMoveError.new("invalid move")
    end
  end

  def seed_board
    Deck.build_deck.each.with_index do |card, i|
      target_pile   = i % 8
      pile_depth    = @piles[target_pile].count
      card.tableau  = self
      card.position = [target_pile, pile_depth]

      @piles[target_pile] << card
    end
  end

  def render_all
    render_freecells
    render_foundations
    render_piles
  end

  def render_foundations
    line = [" "]
    @piles[12..15].each.with_index do |pile, index|
      if pile.empty?
        line << FOUNDATIONS[index]  # needs to show suit of cards
      else
        line << pile.last.to_s
      end
    end
    puts "Foundations:"
    puts line.join(" | ") + " |"
  end

  def render_freecells
    line = [" "]
    @piles[12..15].each.with_index do |pile, index|
      if pile.empty?
        line << "  X"  # needs to show suit of cards
      else
        line << pile.last.to_s
      end
    end
    puts "Freecells:"
    puts line.join(" | ") + " |"
  end

  def render_labels
    labels = "   "
    (max_pile_size).times do |num|
      labels.concat("  #{num}   ")
    end

    puts labels
  end

  def render_piles
    puts 'Card stacks'
    render_labels
    @piles[0..7].each.with_index do |pile, index|
      line = [index]
      if pile.empty?
        line << 'empty'
      else
        pile.each do |item|
          line << item.to_s
        end
      end
    puts line.join(" | ")
    end
  end



end

b = Tableau.new
# p b.piles.first.last.valid_move?(13)

all_moves = []

b.cards.each do |card|
  all_moves << [card.position, card.value, card.moves]
end
p all_moves
b.render_all
