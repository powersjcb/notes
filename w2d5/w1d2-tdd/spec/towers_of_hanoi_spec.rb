require 'rspec'
require 'towers_of_hanoi'

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }

  it 'Keep three arrays, which represents the piles of discs' do
    expect(game.stacks.length).to eq(3)
  end


  describe "#move_disc" do
    context "valid moves" do
      before(:each) { game.move_disc(0,2) }

      it 'moves disc to new pile' do
        expect(game.stacks[2]).to eq([1])
      end

      it 'removes disc from old pile' do
        expect(game.stacks[0]).to eq([2,3,4])
      end
    end

    context "invalid moves" do
      before(:each) { game.move_disc(0,2) }

      it "raises error if moved from nil" do
          expect { game.move_disc(1,2) }.to raise_error()
      end

      it "raises error if existing disc is smaller than moved disc" do
        expect { game.move_disc(0,2) }.to raise_error()
      end
    end
  end

  describe "#won?" do
    let(:winner) { TowersOfHanoi.new }

      it 'determines a win correctly' do
        winner.instance_variable_set(:@stacks, [[], [], [1,2,3,4]])
        expect(winner.won?).to be(true)
      end

      it "doesn't win if game isn't won" do
        expect(game.won?).to be(false)
      end
  end
end
