require 'rspec'
require 'towers'
require 'byebug'

describe "Towers of Hanoi class" do
subject(:game) {TowersOfHanoi.new}

  describe "#initialize" do
    it "creates three disk piles" do
      expect(game.piles.length).to eq(3)
    end

    it "puts all disks onto the first pile" do
      expect(game.piles[0]).not_to be_empty
      expect(game.piles[1] + game.piles[2]).to be_empty
    end

    it "does not accept an argument"do
      expect do
        TowersOfHanoi.new("invalid thing")
      end.to raise_error(ArgumentError)
    end

  end

  describe "#move" do
    it "checks for valid move" do

      expect(game).to receive(:valid_move?)
      game.valid_move?(0,1)
    end

    it "raises error if not a valid move" do
      expect { game.move(2,0) }.to raise_error(RuntimeError)
    end

    it "removes disk from selected pile" do
      game.move(0,1)
      expect(game.piles[0]).to eq([3,2])
    end

    it "puts disk in new pile" do
      game.move(0,1)
      expect(game.piles[1]).to eq([1])
    end

  end

  describe "#won?" do

    it 'return false all disks are in initial pile' do
      expect(game.won?).to be(false)
    end

    it 'returns true when a pile is filled that is not the initial pile' do
      game.piles[1] += [3, 2, 1]
      game.piles[0] = []
      expect(game.won?).to be (true)
    end

  end

end
