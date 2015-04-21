
def times_two(array)
  array.map(&:double)
end

class Integer
  def double
    self*2
  end
end

class Array
  def my_each(&block)
    self.length.times do |index|
      block.call(self[index])
    end
    self
  end
end

def median(arr)
  midpoint = arr.length / 2
  arr.length.odd? ? arr[midpoint] : (arr[midpoint - 1] + arr[midpoint]) / 2.to_f
end

puts "times_two test"
puts times_two([1, 2, 3, 4]) == [2, 4, 6, 8]

p "my_each test"
return_value = [1, 2, 3]
return_value.my_each do |num|
  puts num
end.my_each do |num|
  puts num
end
p return_value == [1, 2, 3]

p "median tests"
p median([1,2,3]) == 2
p median([1,2,3,4]) == 2.5

p "concat test"
p string_cats(["Yay ", "for ", "strings!"]) == "Yay for strings!"
def string_cats(array)
  array.inject(:+)
end
