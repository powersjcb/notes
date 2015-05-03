require_relative 'moveable_card'

class Deck
  def self.build_deck
    cards = [ ]
    MoveableCard.values.each do |value|
      MoveableCard.suits.each do |suit|
        options = { suit: suit, value: value }
        cards << MoveableCard.new(options)
      end
    end

    Deck.new(cards).shuffle!
  end

  def initialize(cards)
    @cards = cards
  end

  def inspect
    @cards
  end

  def count
    @cards.count
  end

  def shuffle!
    @cards.shuffle!
  end

  def deal(n)
    raise "not enough cards in deck" if n > count
    @cards.shift(n)
  end

  def return_cards(cards)
    @cards.concat(cards)
  end

end
