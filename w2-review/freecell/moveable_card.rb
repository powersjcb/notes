require_relative 'card'


class MoveableCard < Card
  # piles       rows 0..7
  # freecells   rows 8..11
  # foundations rows 12..15

  attr_accessor :position, :tableau

  def initialize(options)
    defaults = { position: [], tableau: Object }
    defaults.merge(options)
    super(options)

    @position = options[:position]
    @tableau  = options[:tableau]
  end

  def moves
    (0..15).to_a.select { |new_pos| valid_move?(new_pos) }
  end

  def valid_move?(new_pos)
    if top_of_stack?
      empty_stack?(new_pos) && !foundation?(new_pos) ||
        valid_foundation_move?(new_pos) ||
        !foundation?(new_pos) && consecutive_with_top?(new_pos) &&
          !top_matches_color?(new_pos)


    else # burried in a stack
      !foundation?(new_pos) && !freecell?(new_pos) &&
        consecutive_with_top?(new_pos) && not_burried_too_deep?
    end
  end

  def top_of_stack?
    row, depth = @position
    depth == @tableau.piles[row].size - 1
  end

private
  # methods looking at card on top of piles

  def consecutive?(card)
    order + 1 == card.order
  end

  def empty_stack?(new_pos)
    @tableau.piles[new_pos].empty?
  end

  def valid_foundation_move?(new_pos)
    !empty_stack?(new_pos) && suit_foundation?(new_pos) &&
      ascending_order?(new_pos) ||
      suit_foundation?(new_pos) && value == :ace
  end

  def foundation?(new_pos)
    new_pos.between?(12, 15)
  end

  def freecell?(new_pos)
    new_pos.between?(8, 11)
  end

  def suit_foundation?(new_pos)
    case new_pos
    when 12 # hearts
      return true if @suit == :hearts
    when 13 # spades
      return true if @suit == :spades
    when 14 # diamonds
      return true if @suit == :diamonds
    when 15 # clubs
      return true if @suit == :clubs
    end
    false
  end

  def matches_color?(card)
    @color == card.color
  end

  def matches_suit?(card)
    @suit == card.suit
  end

  def number_to_top # inclusive of card
    row, depth = @position
    @tableau.piles[row].drop(depth).count + 1
  end

  def not_burried_too_deep?
    number_to_top <= @tableau.free_cells + 1
  end

  def ascending_order?(new_pos)
    value == top_card(new_pos).order - 1
  end

  def top_card(new_pos)
    @tableau.piles[new_pos].last
  end

  def consecutive_with_top?(new_pos)
    consecutive?(top_card(new_pos))
  end

  def top_matches_suit?(new_pos)
    matches_suit?(top_card(new_pos))
  end

  def top_matches_color?(new_pos)
    same_color(top_card(new_pos))
  end

  def top_same_color?(new_pos)
    same_color(top_card(new_pos))
  end

  def ordered_and_alternating_above?
    row, depth = @position
    last_card = self
    @tableau.piles[row].drop(depth).each do |card|
      return false if last_card.matches_color(card) ||
                      !last_card.consecutive?(card)
      last_card = card
    end

    true
  end

  def same_color(card)
    @color == card.color
  end

end
