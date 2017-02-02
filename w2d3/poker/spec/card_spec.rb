require 'rspec'
require 'card'

describe Card do
  subject(:two_spade){ Card.new(:spade, :two) }

  describe "#initialize" do
    it "accepts suit and value as arguments" do
      expect(Card).to receive(:new).with(:diamond, :three)
      Card.new(:diamond, :three)
    end

    it "assigns correct suit and value" do
      expect(two_spade.suit).to eq(:spade)
      expect(two_spade.value).to eq(:two)
    end
  end
end
