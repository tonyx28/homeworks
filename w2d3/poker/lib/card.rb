class Card
  attr_reader :suit, :value
  attr_accessor :location

  def initialize(suit, value, location=:pile)
    @suit = suit
    @value = value
    @location = location
  end
end
