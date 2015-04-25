class Array
  def merge_sort
    return self if count < 2

    mid = length / 2

    right = self.drop(mid)
    left  = self.take(mid)

    sorted_left = left.merge_sort
    sorted_right = right.merge_sort

    merge(sorted_left, sorted_right)
  end

  def merge(left,right)
    merged_array = []
    until left.empty? || right.empty?
      merged_array << ((left.first < right.first) ? left.shift : right.shift)
    end
    merged_array + left + right
  end
end


p [1,2].merge_sort
