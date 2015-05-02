class Array
  def my_transpose
    new_array = Array.new(self[0].length) { Array.new(self.length) }
    self.each_with_index do |row, idx1|
      row.each_with_index do |el, idx2|
        new_array[idx2][idx1] = el
      end
    end

    new_array
  end
end
