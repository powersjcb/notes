require 'rspec'
require 'card'

describe Card do
  describe "#initialize" do
    it "creates instance of card class" do
      expect(Card.new(:spades, :king)).to be_a(Card)
    end

    context "doesn't create invalid cards" do
      it "raise error for invalid suit" do
        expect { Card.new("invalid_suit", :king) }.to raise_error
      end

      it "raise error for invalid value" do
        expect { Card.new(:spades, "invalid_value") }.to raise_error
      end
    end
  end

  describe 'provide attributes' do
    subject(:card) { Card.new(:spades, :king) }

    it 'returns value' do
      expect(card.value).to eq(:king)
    end

    it 'returns suit' do
      expect(card.suit).to eq(:spades)
    end

    it 'returns rank' do
      expect(card.rank).to eq(13)
    end
  end
end
