require 'byebug'
class TowersOfHanoi
  attr_reader :piles

  def initialize
    @piles = Array.new(3) {Array.new}
    @piles[0] += [3,2,1]
  end

  def play
    until won?
      p @piles
      start_pile, end_pile = prompt
      move(start_pile, end_pile)
    end
    p @piles
    return 'game over'
  end

  def move(start_pile, end_pile)
    raise "error" unless valid_move?(start_pile, end_pile)
    disk = @piles[start_pile].pop
    @piles[end_pile] << disk
  end

  def valid_move?(start_pile, end_pile)
    start_disk = piles[start_pile].last
    end_disk = piles[end_pile].last

    return false unless start_disk
    return true if end_disk.nil? || start_disk < end_disk
    false
  end

  def won?
    winning_state = [3,2,1]
    @piles[1] == winning_state || @piles[2] == winning_state
  end

  def prompt
    begin
      puts "select start pile"
      start_pile = gets.chomp.to_i
      puts "select end pile"
      end_pile = gets.chomp.to_i
      raise "error" unless valid_move?(start_pile, end_pile)
    rescue => e
      p e
      retry
    end
    [start_pile, end_pile]
  end

end
