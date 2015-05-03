# -*- coding: utf-8 -*-

# Represents a playing card.
class Card
  SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  VALUE_STRINGS = {
    :deuce => " 2",
    :three => " 3",
    :four  => " 4",
    :five  => " 5",
    :six   => " 6",
    :seven => " 7",
    :eight => " 8",
    :nine  => " 9",
    :ten   => "10",
    :jack  => " J",
    :queen => " Q",
    :king  => " K",
    :ace   => " A"
  }

  ORDER = {
    :ace   => 1,
    :deuce => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 11,
    :queen => 12,
    :king  => 13
  }

  # Returns an array of all suits.
  def self.suits
    SUIT_STRINGS.keys
  end

  # Returns an array of all values.
  def self.values
    VALUE_STRINGS.keys
  end

  attr_reader :suit, :value, :color

  def initialize(options)
    suit  = options[:suit]
    value = options[:value]
    unless Card.suits.include?(suit) and Card.values.include?(value)
      raise "illegal suit (#{suit}) or value (#{value})"
    end
    @color = ([:clubs, :spades].include?(suit)) ? :black : :red
    @suit, @value = suit, value
  end

  def order
    ORDER[value]
  end

  # Compares two cards to see if they're equal in suit & value.
  def ==(other_card)
  end

  def to_s
    VALUE_STRINGS[value] + SUIT_STRINGS[suit]
  end
end
