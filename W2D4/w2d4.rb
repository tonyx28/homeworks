class Octopus
  FISHES = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
    'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

  def sluggish
    longest_fish = ""
    FISHES.length.times do |n|
      longest_fish = FISHES[n] if FISHES[n].length > longest_fish.length
      FISHES.length.times do |m|
        next if n == m
        longest_fish = FISHES[m] if FISHES[m].length > longest_fish.length
      end
    end
    longest_fish
  end

  def self.merge_sort (array, &prc)
    return array if array.length <= 1

    mid_idx = array.length / 2
    merge(
      merge_sort(array.take(mid_idx), &prc),
      merge_sort(array.drop(mid_idx), &prc),
      &prc
    )
  end

  # NB: In Ruby, shift is an O(1) operation. This is not true of all languages.
  def self.merge(left, right, &prc)
    merged_array = []
    prc = Proc.new { |num1, num2| num1.length <=> num2.length } unless block_given?
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged_array << left.shift
      when 0
        merged_array << left.shift
      when 1
        merged_array << right.shift
      end
    end

    merged_array + left + right
  end

  def clever
    longest_fish = ""
    FISHES.each do |fish|
      longest_fish = fish if longest_fish.length < fish.length
    end
    longest_fish
  end

  def slow_dance(direction,tiles_array)
    tiles_array.index(direction)
  end

  tiles_hash = {
      "up" => 0,
      "right-up" => 1,
      "right"=> 2,
      "right-down" => 3,
      "down" => 4,
      "left-down" => 5,
      "left" => 6,
      "left-up" => 7
  }
  def fast_dance(direction,tiles_hash)
    tiles_hash[direction]
  end

end



if __FILE__ == $PROGRAM_NAME
  a = Octopus.new
p  a.sluggish
p  b = Octopus.merge_sort(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
    'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']).last

p   c = a.clever
  tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
p  a.slow_dance("up",tiles_array)
p  a.slow_dance("right-down",tiles_array)
p  a.fast_dance("up",tiles_array)
p  a.fast_dance("right-down",tiles_array)

end
