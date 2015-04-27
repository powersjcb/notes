require 'pry'
class Array
  def bubble_sort_iterative!
    is_sorted = false

    until is_sorted
      is_sorted = true
      (length-1).times do |i|
        if self[i] > self[i+1]
          self[i], self[i+1] = self[i+1], self[i]
          is_sorted = false
        end
      end
    end

    self
  end

  def bubble_sort_iterative
    self.dup.bubble_sort_iterative!
  end

end


a = [1,2,3,5,1,2,3,4,5]
puts "Unsorted"
p a
a.bubble_sort_iterative!
puts "sorted, destructive"
p a

b = [4,3,2,1,0]
puts 'unsorted'
p b
puts 'sorted'
p b.bubble_sort_iterative
puts 'not destructive'
p b
