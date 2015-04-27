require 'pry-byebug'

def binary_search_rec(nums, target)
  return nil if nums.empty?
  return  0  if nums.one? && nums[0] == target
  pivot = (nums.count) / 2
  if nums[pivot-1] >= target
    binary_search_rec(nums.take(pivot), target)
  else
    possible = binary_search_rec(nums.drop(pivot), target)
    possible.nil? ? nil : possible + pivot
  end
end


# p binary_search_rec([1,2,5,6,7,10,15,35], 3)
