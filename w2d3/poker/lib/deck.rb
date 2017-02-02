require_relative 'card'

class Deck
  VALUES = %w(two three four five six
  seven eight nine ten J Q K A).map(&:to_sym)
  SUITS = [:spades, :diamonds, :hearts, :clubs]

  attr_accessor :cards

  def initialize
    create_cards
  end

  def create_cards
    @cards = []
    VALUES.each do |value|
      SUITS.each do |suit|
        @cards << Card.new(suit,value)
      end
    end
  end

  def shuffle!
    @cards.shuffle!
  end

  def dup
    array = []

    @cards.each do |card|
      array << Card.new(card.suit, card.value)
    end

    new_deck = Deck.new
    new_deck.cards = array
    new_deck
  end
end
