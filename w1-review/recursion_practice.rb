require 'pry'
def my_range(start, final)
  return [] if start > final
  [start] + my_range(start+1,final)
end

# p my_range(1,10)


def sum_iter(nums)
  sum = nums.shift
  nums.each { |num| sum += num}
  sum
end

def sum_recursive(nums)
  return 0 if nums.empty?

  nums[0] + sum_recursive(nums.drop(1))
end
#
# p sum_tracker([1,2,3])
# # p sum_recursive([0,1,2,3,4])
# # p sum_iter([5,1,3,5,5])


class Array
  def deep_dup
    map { |el| self.is_a?(Array) ? el.deep_dup : el.dup }
  end
end
