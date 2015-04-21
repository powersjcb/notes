def factors(num)
  result = []
  index = 1
  while index <= Math.sqrt(num)
    if num % index == 0
      result << index
      result << num / index
    end
    index += 1
  end
  result.uniq.sort
end

puts factors(6) == [1, 2, 3, 6]
p factors(10)
p factors(25)
