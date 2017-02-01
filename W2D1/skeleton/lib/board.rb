require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_index do |i|
      @cups[i] = stones(4) unless i == 6 || i == 13
    end
    @cups
  end

  def stones(n)
    stones = []
    n.times { stones << :stone }
    stones
  end

  def valid_move?(start_pos)
    if start_pos.between?(1,14) == false
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].count
    @cups[start_pos] = []
    current_pos = start_pos + 1
    while stones > 0
      # debugger
      current_pos %= 14
      if (current_pos == 13 && current_player_name == @name1) ||
          (current_pos == 6 && current_player_name == @name2)
        current_pos += 1
      else
        @cups[current_pos] += [:stone]
        stones -= 1
        current_pos += 1 unless stones == 0
      end
    end
    render
    next_turn(current_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx] == [:stone]
      return :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[1..6].all? { |cup| cup.empty? }
    return true if @cups[7..13].all? { |cup| cup.empty? }
    false
  end

  def winner
    if @cups[6] == @cups[13]
      return :draw
    else
      @cups[6].length > @cups[13].length ? @name1 : @name2
    end
  end
end

# if __FILE__ == $PROGRAM_NAME
#   a = Board.new("j","k")
#   a.render
#   a.make_move(5,"j")
#   a.render
# end
