def make_change(num, array = [25, 10, 5, 1])
  return [] if num == 0
  return nil if array.none? { |coin| coin <= target }
  return [num] if array.include?(num)
  array.each do |coin|

    array[array.each_with_index.max[1]] = nil unless array.any?(&:nil?)
    if !coin.nil? && num / coin >= array.last
      return [coin] + make_change(num-coin, array)
    end
  end
end

p make_change(100) #== [25,25,25,1,1]
