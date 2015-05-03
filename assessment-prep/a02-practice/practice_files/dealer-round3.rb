require_relative 'player'

class Dealer < Player
  attr_reader :bets

  def initialize(name = "dealer", bankroll = 0)
    super(name, bankroll)

    @bets = Hash.new()
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
    @bets.each do |player, bet|
      if player.hand.beats?(hand)
        player.pay_winnings(bet * 2)
      end
    end
  end
end
