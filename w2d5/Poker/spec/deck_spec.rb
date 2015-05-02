require 'rspec'
require 'deck'
require 'card'

describe Deck do
  describe "::build_deck" do
    subject(:deck) { Deck.build_deck }

    it "creates a new deck" do
      expect(deck).to be_a(Deck)
    end

    it "returns a deck of 52 cards" do
      expect(deck.count).to eq(52)
    end

    it "creates only unique cards" do
      expect(deck.cards.map { |card| [card.suit, card.value] }
          .uniq
          .count
      ).to eq(52)
    end

    it "shuffles the new deck" do
      expect(deck.shallow_dup.cards).to_not eq(deck.shuffle!.cards)
    end
  end


  describe "handles cards" do

    subject(:deck) { Deck.new }

    let(:cards) do
      [Card.new(:hearts, :king),
       Card.new(:clubs, :queen),
       Card.new(:spades, :ace)]
    end

    before(:each) { deck.cards = cards.dup }

    describe "#deal" do

      it "removes the top n cards from the deck" do
        deck.deal(3)
        expect(deck.count).to eq(0)
      end

      it "provides the top n cards from the deck" do
        expect(deck.deal(3)).to eq(cards)
      end

      it "raises error if not enough cards in the deck" do
        expect { deck.deal(4) }.to raise_error
      end
    end

    describe '#return_cards' do

      it "receives cards into bottom of deck" do
        removed_card = deck.deal(1)
        deck.return_cards(removed_card)
        new_deck = Deck.new([Card.new(:clubs, :queen),
                             Card.new(:spades, :ace),
                             Card.new(:hearts, :king)])
        expect(deck == new_deck).to be true
      end

      it "adds cards to deck" do
        new_cards = [Card.new(:diamonds, :jack)]
        new_deck = deck.return_cards(new_cards)
        expect(new_deck.count).to be > 3
      end

      # it "prevents cheating" do
      #   same_cards = [Card.new(:clubs, :queen)]
      #   expect do
      #     deck.return_cards(same_cards)
      #   end.to raise_error(CheaterDetectedError)
      # end
    end

    describe "#==" do

      subject(:same_deck) { Deck.new }

      let(:same_cards) do
        [Card.new(:hearts, :king),
         Card.new(:clubs, :queen),
         Card.new(:spades, :ace)]
      end

      before(:each) { same_deck.cards = same_cards }

      it "compares itself to other decks" do
        expect(deck == same_deck).to be true
      end
    end
  end
end

  #return
  # returns only unique
  #shuffle


    # it "should shuffle the deck" do
    #   expect(deck.build_deck).to call(:shuffle)
    # end
