class Array
  def my_uniq
    unique = []
    self.each do |el|
      unique << el unless unique.include?(el)
    end
    unique
  end

  def two_sum
    result = []
    self.each_with_index do |el1, i1|
      self.each_with_index do |el2,i2|
        if i1 < i2 && el1 + el2 == 0
          result << [i1,i2]
        end
      end
    end
    result
  end

  def my_transpose
    arr = []

    self[0].length.times do |i1|
      subarr = []

      self.length.times do |i2|
        subarr << self[i2][i1]
      end

      arr << subarr
    end

    arr
  end

  def stock_picker
    best_margin = self[1] - self[0]
    best_days = [0,1]

    self.each_with_index do |price1, day1|
      self.each_with_index do |price2, day2|
        if day2 > day1 && price2 - price1 > best_margin
          best_margin = price2 - price1
          best_days = [day1,day2]
        end
      end
    end
    best_days
  end

  # pick_stock([[0, 41],8,94,8,0])

end
