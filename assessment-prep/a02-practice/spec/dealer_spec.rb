require 'dealer'
require 'player'

describe Dealer do
  subject(:dealer) { Dealer.new }

  it "calls super with a default name/empty bankroll" do
    expect(dealer.name).to eq("dealer")
    expect(dealer.bankroll).to eq(0)
  end

  it "is a Player subclass" do
    expect(dealer).to be_a(Player)
  end

  it "does not place bets" do
    expect do
      dealer.place_bet(dealer, 100)
    end.to raise_error("Dealer doesn't bet")
  end

  describe "#play_hand" do
    let(:dealer_hand) { double("hand") }
    let(:deck) { double("deck") }

    before do
      dealer.hand = dealer_hand
    end

    it "does not hit on seventeen" do
      allow(dealer_hand).to receive_messages(
        :busted? => false,
        :points => 17
      )
      expect(dealer_hand).not_to receive(:hit)

      dealer.play_hand(deck)
    end

    it "hits until seventeen acheived" do
      allow(dealer_hand).to receive_messages(:busted? => false)

      # need to use a block to give points, because we'll hit hand and
      # points will change
      points = 12
      allow(dealer_hand).to receive(:points) do
        # returns `points` defined in the outside local variable. The
        # `points` variable is said to be *captured*.
        points
      end
      expect(dealer_hand).to receive(:hit).with(deck).exactly(3).times do
        # changes `points` variable above, faking addition of new
        # cards.
        points += 2
      end

      dealer.play_hand(deck)
    end

    it "stops when busted" do
      points = 16
      allow(dealer_hand).to receive(:points) { points }
      allow(dealer_hand).to receive(:busted?) { points > 21 }

      expect(dealer_hand).to receive(:hit).once.with(deck) do
        points = 22
      end

      dealer.play_hand(deck)
    end
  end

  context "with a player" do
    let(:player) { double("player", :hand => player_hand) }
    let(:dealer_hand) { double("dealer_hand") }
    let(:player_hand) { double("player_hand") }

    before(:each) do
      dealer.hand = dealer_hand
      allow(player).to receive_messages(:hand => player_hand)

      dealer.take_bet(player, 100)
    end

    it "records bets" do
      expect(dealer.bets).to eq({ player => 100 })
    end

    it "does not pay losers (or ties)" do
      expect(player_hand).to receive(:beats?).with(dealer_hand).and_return(false)
      expect(player).not_to receive(:pay_winnings)

      dealer.pay_bets
    end

    it "does pay winners" do
      expect(player_hand).to receive(:beats?).with(dealer_hand).and_return(true)

      # wins twice the bet
      expect(player).to receive(:pay_winnings).with(200)

      dealer.pay_bets
    end
  end
end
