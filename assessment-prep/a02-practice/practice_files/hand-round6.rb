require 'pry'
class Hand
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    aces = 0
    sum = 0
    @cards.each do |card|
      if card.value == :ace
        sum += 11
        aces += 1
      else
        sum += card.blackjack_value
      end
    end

    until aces == 0 || sum <= 21
      aces -= 1
      sum -= 10
    end

    sum
  end

  def busted?
    points > 21
  end

  def hit(deck)
    raise "already busted" if busted?
    @cards.concat(deck.take(1))
  end

  def beats?(other_hand)
    return false if busted?
    points > other_hand.points || other_hand.busted?
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
