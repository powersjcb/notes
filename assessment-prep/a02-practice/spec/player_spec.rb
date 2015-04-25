require 'player'

describe Player do
  subject(:player) do
    Player.new("Nick the Greek", 200_000)
  end

  it "assigns the name" do
    expect(player.name).to eq("Nick the Greek")
  end
  it "assigns the bankroll" do
    expect(player.bankroll).to eq(200_000)
  end

  describe "#pay_winnings" do
    it "adds to winnings" do
      player.pay_winnings(200)

      expect(player.bankroll).to eq(200_200)
    end
  end

  describe "#return_cards" do
    let(:deck) { double("deck") }
    let(:hand) { double("hand", :return_cards => nil) }

    before(:each) { player.hand = hand }

    it "returns player's cards to the deck" do
      expect(hand).to receive(:return_cards).with(deck)
      player.return_cards(deck)
    end

    it "resets hand to nil" do
      player.return_cards(deck)
      expect(player.hand).to be_nil
    end
  end

  describe "#place_bet" do
    let(:dealer) { double("dealer", :take_bet => nil) }

    it "registers bet with dealer" do
      expect(dealer).to receive(:take_bet).with(player, 10_000)
      player.place_bet(dealer, 10_000)
    end

    it "deducts bet from bankroll" do
      player.place_bet(dealer, 10_000)
      expect(player.bankroll).to eq(190_000)
    end

    it "enforces limits" do
      expect do
        player.place_bet(dealer, 1_000_000)
      end.to raise_error("player can't cover bet")
    end
  end
end
