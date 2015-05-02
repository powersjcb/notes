class Card
  SUITS = {
    clubs: "♣",
    diamonds: "♦",
    hearts: "♥",
    spades: "♠"
  }

  VALUES = {
    deuce: 2,
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9,
    ten: 10,
    jack: 11,
    queen: 12,
    king: 13,
    ace: 14
  }

  attr_accessor :value, :suit

  def initialize(suit, value)
    raise ArgumentError.new("invalid card") unless valid_card?(suit, value)
    @suit  = suit
    @value = value
  end

  def rank
    VALUES[value]
  end

  def self.values
    VALUES.keys
  end

  def self.suits
    SUITS.keys
  end

  def ==(other_card)
    value == other_card.value && suit == other_card.suit
  end

  def inspect
    {:value => @value, :suit => suit}.inspect
  end

  private

  def valid_card?(suit, value)
    VALUES.key?(value) && SUITS.key?(suit)
  end
end
