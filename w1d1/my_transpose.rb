class Array
  def my_transpose
    transposed = []
    (0..self.length - 1).each do |col_idx|
      sub_array = []
      (0..self.length - 1).each do |row_idx|
        # sub array is row of solution
        sub_array << self[row_idx][col_idx]
      end
      transposed << sub_array
    end
    transposed
  end
end

p [[0, 1, 2],[3, 4, 5],[6, 7, 8]].my_transpose == [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
