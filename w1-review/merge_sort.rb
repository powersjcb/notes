class Array
  def merge_sort
    return self if count < 2
    left, right = self.take(count/2), self.drop(count/2)

    merge(left.merge_sort, right.merge_sort)
  end

  def merge(left, right)  # merges two sorted arrays onto the end of Array

    merged_array = [ ]
    until left.empty? || right.empty?
      merged_array <<
        ((left.first < right.first) ? left.shift : right.shift)
    end

    merged_array + left + right
  end
end
