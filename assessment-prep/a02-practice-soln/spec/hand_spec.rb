require 'card'
require 'hand'

describe Hand do
  describe "::deal_from" do
    it "deals a hand of two cards" do
      deck_cards = [
        Card.new(:spades, :deuce),
        Card.new(:spades, :three)
      ]

      deck = double("deck")
      expect(deck).to receive(:take).with(2).and_return(deck_cards)

      hand = Hand.deal_from(deck)

      expect(hand.cards).to match_array(deck_cards)
    end
  end

  describe "#points" do
    it "adds up normal cards" do
      hand = Hand.new([
          Card.new(:spades, :deuce),
          Card.new(:spades, :four)
        ])

      expect(hand.points).to eq(6)
    end

    it "counts an ace as 11 if it can" do
      hand = Hand.new([
          Card.new(:spades, :ten),
          Card.new(:spades, :ace)
        ])

      expect(hand.points).to eq(21)
    end

    it "counts some aces as 1 and others as 11" do
      hand = Hand.new([
          Card.new(:spades, :ace),
          Card.new(:spades, :ten),
          Card.new(:hearts, :ace)
        ])

      expect(hand.points).to eq(12)
    end
  end

  describe "#busted?" do
    it "is busted if points > 21" do
      hand = Hand.new([])
      allow(hand).to receive_messages(:points => 22)

      expect(hand).to be_busted
    end

    it "is not busted if points <= 21" do
      hand = Hand.new([])
      allow(hand).to receive_messages(:points => 21)

      expect(hand).to_not be_busted
    end
  end

  describe "#hit" do
    it "draws a card from deck" do
      deck = double("deck")
      card = double("card")
      expect(deck).to receive(:take).with(1).and_return([card])

      hand = Hand.new([])
      hand.hit(deck)

      expect(hand.cards).to include(card)
    end

    it "doesn't hit if busted" do
      deck = double("deck")
      expect(deck).to_not receive(:take)

      hand = Hand.new([])
      expect(hand).to receive(:busted?).and_return(true)

      expect do
        hand.hit(deck)
      end.to raise_error("already busted")
    end
  end

  describe "#beats?" do
    it "returns true if other hand has fewer points" do
      hand1 = Hand.new([
          Card.new(:spades, :ace),
          Card.new(:spades, :ten)
        ])
      hand2 = Hand.new([
          Card.new(:hearts, :ace),
          Card.new(:hearts, :nine)
        ])

      expect(hand1.beats?(hand2)).to be(true)
      expect(hand2.beats?(hand1)).to be(false)
    end

    it "returns false if hands have equal points" do
      hand1 = Hand.new([
          Card.new(:spades, :ace),
          Card.new(:spades, :ten)
        ])
      hand2 = Hand.new([
          Card.new(:hearts, :ace),
          Card.new(:hearts, :ten)
        ])

      expect(hand1.beats?(hand2)).to be(false)
      expect(hand2.beats?(hand1)).to be(false)
    end

    it "returns false if busted" do
      hand1 = Hand.new([
          Card.new(:spades, :ten),
          Card.new(:hearts, :ten),
          Card.new(:clubs, :ten)
        ])
      hand2 = Hand.new([
          Card.new(:hearts, :deuce),
          Card.new(:hearts, :three)
        ])

      expect(hand1.beats?(hand2)).to be(false)
      expect(hand2.beats?(hand1)).to be(true)
    end
  end

  describe "#return_cards" do
    let(:deck) { double("deck") }
    let(:hand) do
      Hand.new([Card.new(:spades, :deuce), Card.new(:spades, :three)])
    end

    it "returns cards to deck" do
      expect(deck).to receive(:return) do |cards|
        expect(cards.count).to eq(2)
      end

      hand.return_cards(deck)
    end

    it "removes card from hand" do
      allow(deck).to receive(:return)

      hand.return_cards(deck)
      expect(hand.cards).to eq([])
    end
  end
end
