class MyHashSet
  # attr_accessor :store

  def initialize
    @store = {}
  end

  def insert(el)
    @store[el] = true
  end

  def include?(el)
    @store.has_key?(el)
  end

  def delete(el)
    !!@store.delete(el)
  end

  def to_a
    @store.keys
  end

  def union(set2)
    set3 = MyHashSet.new
    set3.store = self.store.merge(set2.store)
    set3
  end

  def intersect(set2)
    set3 = MyHashSet.new
    set3.store = self.store.select { |el| set2.include?(el) }
    set3
  end

  def minus(set2)
    set3 = MyHashSet.new
    set3.store = self.store.reject { |el| set2.include?(el) }
    set3
  end

end

#
set1 = MyHashSet.new
10.times { |value| set1.insert(value) }
set2 = MyHashSet.new
set2.insert(15)
set1.store
puts set1.include?(5) == true
puts set1.delete(5) == true
puts set1.delete(5) == false
puts set1.include?(5) == false
puts set1.include?(11) == false
puts set1.to_a == [0, 1, 2, 3, 4, 6, 7, 8, 9]
puts set1.to_a.length == 9
puts set1.union(set2).to_a == [0, 1, 2, 3, 4, 6, 7, 8, 9, 15]
set2.insert(9)
puts set1.intersect(set2).to_a == [9]
puts set1.minus(set2).to_a == [0, 1, 2, 3, 4, 6, 7, 8]
