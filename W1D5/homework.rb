class Stack
  def initialize
    @stack = Array.new
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end
end

class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end
end


class Map
  def initialize
    @map = Array.new { Array.new(2) }
  end

  def assign(key, value)
    key_index = @map.index { |set| set[0] == key }
    key_index == nil ? @map << [key, value] : @map[key_index][1] = value
  end

  def lookup(key)
    @map.each { |set| return set[1] if set[0] == key}

    nil
  end

  def remove(key)
    @map.delete_if { |set| set[0] == key }

    nil
  end

  def show
    @map
  end

end

# a = Stack.new
# p a.add(5)
# p a.add(6)
# p a.add(7)
# p a.add(8)
# p a.show
# p a.remove
# p a.show
#
# q = Queue.new
# p q.enqueue(5)
# p q.enqueue(7)
# p q.enqueue(8)
# p q.enqueue(6)
# p q.dequeue
# p q.show

# m = Map.new
# p m.assign("dogs",2)
# p m.assign("puppies",5)
# p m.assign("cats",0)
# p m.lookup("puppies")
# p m.show
# p m.remove("cats")
# p m.show
