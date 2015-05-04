require_relative 'deck'
require 'pry-byebug'
require 'colorize'
require_relative 'invalid_move_error'



class String
  def green_bg
    colorize(background: :green)
  end

  def red_token
    colorize(color: :red, background: :green)
  end

  def black_token
    colorize(color: :black, background: :green)
  end
end



class Tableau

  FOUNDATIONS =  { 0 => "  ♥".red_token,
                   1 => "  ♠".black_token,
                   2 => "  ♦".red_token,
                   3 => "  ♣".black_token }

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
    copied_tab = Tableau.new(false)

    cards.each do |card|
      options = {suit:     card.suit,     value:   card.value,
                 position: card.position.dup, tableau: copied_tab}
      new_card = MoveableCard.new(options)
      copied_tab.piles[card.position[0]] << new_card
    end

    copied_tab
  end

  def free_cells
    @piles.take(12).count(&:empty?) # excludes foundations
  end

  def max_pile_size
    @piles.max_by(&:count).count
  end

  def move(card_position, stack_position)
    unless self[card_position].moves.include?(stack_position)
      raise InvalidMoveError.new("invalid move")
    end

    # record size of new position before move
    new_first_depth = @piles[stack_position].count

    #move cards
    old_pile, depth = card_position
    moved_cards = @piles[old_pile].pop(@piles[old_pile].size - depth)
    @piles[stack_position].concat(moved_cards)

    # update card.position after move
    d_depth = new_first_depth - depth

    moved_cards.each do |card|
      card.position = [stack_position, d_depth + card.position[1] ]
    end
    nil
  end

  def seed_board
    deck = Deck.build_deck
    deck.shuffle! unless __FILE__ == $0
    i = 0
    until deck.count == 0
      card = deck.deal(1)[0]
      target_pile   = i % 8
      pile_depth    = @piles[target_pile].count
      card.tableau  = self
      card.position = [target_pile, pile_depth]

      @piles[target_pile] << card
      i += 1
    end

    self
  end

  def render_all
    render_freecells
    render_foundations
    render_piles
  end

  def render_foundations
    line = [" ".green_bg]
    @piles[12..15].each.with_index do |pile, index|
      if pile.empty?
        line << FOUNDATIONS[index]  # needs to show suit of cards
      else
        line << pile.last.to_s
      end
    end
    puts "Foundations:".green_bg
    puts line.join(" | ".green_bg) + " |".green_bg
  end

  def render_freecells
    line = [" ".green_bg]
    @piles[8..11].each.with_index do |pile, index|
      if pile.empty?
        line << "  X".green_bg  # needs to show suit of cards
      else
        line << pile.last.to_s
      end
    end
    puts "Freecells:".green_bg
    puts line.join(" | ".green_bg) + " |".green_bg
  end

  def render_labels
    labels = "   ".green_bg
    8.times do |num|
      labels.concat("  #{num}   ".green_bg)
    end

    puts labels
  end

  def render_piles
    puts 'Card piles'.green_bg
    render_labels

    max_pile_size.times do |row_index|
      line = [row_index.to_s.green_bg]
      8.times do |pile_index|
        if piles[pile_index].empty? && row_index == 0
          line << "  X ".green_bg
        elsif self[[pile_index, row_index]].nil?
          line << "   ".green_bg
        else # has a card
          line << self[[pile_index, row_index]].to_s
        end
      end
        puts line.join(" | ".green_bg) + " |".green_bg
    end
  end

  def won?
    piles[0..11].all? { |pile| pile.empty? }
  end

end



if __FILE__ == $0
  b = Tableau.new
  # b.move([0,6],15)
  # b.move([0,5],6)
  # b.move([1,6])
  b.render_all
end
