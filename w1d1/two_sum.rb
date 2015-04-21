class Array
  def two_sum
    results = []
    self.each_with_index do |item, index|
      ((index + 1)...(self.length - 1)).each do |index2|
        results << [index, index2] if self[index] + self[index2] == 0
      end
    end
    results
  end
end

p [-1, 0, 2, -2, 1].two_sum == [[0, 4], [2, 3]]
