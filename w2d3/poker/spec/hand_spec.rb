require 'rspec'
require 'hand'


describe Hand do
  let(:card0) { double("two spade"), :suit => :spade, :value => :two }
  let(:card1) { double("two diamond"), :suit => :diamond, :value => :two }
  let(:card2) { double("three spade"), :suit => :spade, :value => :three }
  let(:card3) { double("Q spade"), :suit => :spade, :value => :Q }
  let(:card4) { double("A spade"), :suit => :spade, :value => :A }

  subject(:hand) { Hand.new(player_name) }

  describe "#initialize" do
    it 'accepts player name' do
      expect(Hand).to receive(:new).with("francesca")
      Hand.new("francesca")
    end
  end

  describe "#pair" do
    it "returns array of matching pairs"


  end
end
