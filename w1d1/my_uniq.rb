class Array
  def my_uniq
    result = []
    self.each do |el|
      result << el unless result.include?(el)
    end
    result
  end
end

# puts [1, 2, 1, 3, 3].uniq
puts [1, 2, 1, 3, 3].my_uniq
