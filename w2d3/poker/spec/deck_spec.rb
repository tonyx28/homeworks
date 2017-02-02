require 'rspec'
require 'deck'

describe Deck do
  subject(:new_deck) { Deck.new }
  let(:deck) { Deck.new }

  describe "#initialize" do
    it "creates a deck of 52 cards" do
      expect(new_deck.cards.length).to be(52)
    end

    it "each card is unique" do
      expect(new_deck.cards.uniq).to eq(new_deck.cards)
    end
  end

  describe "#shuffle" do
    it "returns a shuffled deck" do
      a = deck
      b = a.dup
      b.shuffle!
      expect(a.cards).not_to eq(b.cards)
    end
  end

end
