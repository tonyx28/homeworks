class Hand

  attr_reader :cards

  def initialize()
    # @cards = cards
  end

  def pair
    @cards.each
  end

  def two_pair
    pair.length > 2
  end

  def three_of_a_kind
  end

  def flush
  end

  def straight
  end



end
