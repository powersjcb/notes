require_relative 'player'

class Dealer < Player
  attr_reader :bets

  def initialize(name = 'dealer', bankroll = 0)
    super
    @bets = {}
  end

  def place_bet(dealer, amt)
    raise "Dealer doesn't bet"
  end

  def play_hand(deck)
    hand.hit(deck) until hand.points >= 17
  end

  def take_bet(player, amt)
    @bets[player] = amt
  end

  def pay_bets
    @bets.each do |player, bet_amt|
      player.pay_winnings(bet_amt * 2) if player.hand.beats?(hand)
    end
  end
end
