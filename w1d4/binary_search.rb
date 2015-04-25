require 'byebug'
def binary_search(sorted_array, target)
  return nil if sorted_array.length == 0
  return 0 if sorted_array.length == 1 && sorted_array[0] == target

  pivot = sorted_array.length / 2
  if sorted_array[pivot] <= target
    contained = sorted_array[pivot...sorted_array.length]
    index = pivot + binary_search(contained, target)
  elsif sorted_array[pivot] > target
    contained = sorted_array[0...pivot]
    index = binary_search(contained, target)
  end

end


puts binary_search([1,2,3,4,5], 4)
