require 'byebug'
class Array
  def my_sort!(&block)
    block ||= Proc.new { |num1, num2| num1 <=> num2 }
    return self if self.length <= 1
    pivot = self.delete_at(rand(0...self.length))
    left, right = [], []

    self.each_with_index do |el, index|
      spaceship = block.call(el, pivot)
      if spaceship == -1
        left << el
      elsif spaceship == 0
        rand_array = [left, right].sample
        rand_array << el
      elsif spaceship == 1
        right << el
      else
        raise "Not valid comparison"
      end
    end

    left.my_sort!(&block) + [pivot] + right.my_sort!(&block)
  end
end
#
arr = [4,5,7,4,2,2,5,10,99,5000,1,-10,-10,-5]
prc = Proc.new { |num1, num2| num2 <=> num1 }
# p arr.my_sort! { |num1, num2| num2 <=> num1 }
