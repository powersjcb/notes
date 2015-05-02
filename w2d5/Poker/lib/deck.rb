require 'card'

class Deck
  attr_accessor :cards

  def self.build_deck
    cards = []
    Card.values.each do |value|
      Card.suits.each do |suit|
        cards << Card.new(suit, value)
      end
    end

    Deck.new(cards).shuffle!
  end

  def shallow_dup
    Deck.new(@cards.dup)
  end

  def initialize(cards = [])
    @cards = cards
  end

  def count
    @cards.count
  end



  def deal(num)
    raise ArgumentError.new("Not enough cards.") if num > count
    @cards.shift(num)
  end

  def shuffle!
    @cards.shuffle!
    self
  end

  def return_cards(returned_cards)
    # raise CheaterDetectedError.new if any_dups?(return_cards)
    @cards.concat(returned_cards)
  end

  def ==(other_deck)
    return false unless self.count == other_deck.count
    cards.each.with_index do |card, index|
      return false unless card == other_deck.cards[index]
    end

    true
  end

  private
  def any_dups?(new_cards)
    cards != new_cards.concat(cards)
  end
end

class CheaterDetectedError < StandardError
end
