# require 'byebug'
class Array
  def my_inject(accumulator=nil, &block)
    n = 0
    if accumulator.nil?
      accumulator = self[0]
      n = 1
    end
    drop(n).each do |el|
      accumulator = block.call(accumulator,el)
    end

    accumulator
  end
end




def is_prime?(num)
  return false if num == 1 || num == 0
  i = 2
  while i < num
    return false if num % i == 0
    i += 1
  end

  true
end



def primes(count)
  output = []
  i = 2
  until output.size == count
    output << i if is_prime?(i)
    i += 1
  end
  output
end
# the "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
# Also, be aware that the first factorial number is 0!, which is defined
# to equal 1. So the 2nd factorial is 1!, the 3rd factorial is 2!, etc.
def factorials_rec(num)
  return [1] if num == 1
  facts = factorials_rec(num-1)
  facts << facts.last*(num-1)
  facts
end



class Array
  def dups
    locations = Hash.new([])
    each.with_index do |el, index|
      locations[el] += [index]
    end

    locations.reject! {|k,v| v.count < 2 }
  end
end

# p [1,2,3,1,1,2].dups

class String
  def symmetric_substrings
    reversable = []
    substrings = []
    chars.each_index do |i1|
      (i1...self.length).each do |i2|
        substrings << self[i1..i2]
      end
    end

    substrings.each do |el|
      reversable << el if el == el.reverse && el.chars.count > 2
    end

    reversable.uniq
  end
end

# p 'stetssdafsdfd'.symmetric_substrings

class Array
  def merge_sort(&prc)
    # prc ||= Proc.new { |num1, num2| num1 <=> num2 }
    return self if count < 2

    left, right = self.take(count/2), self.drop(count/2)

    sorted_left = left.merge_sort(&prc)
    sorted_right = right.merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)

  end

  private
  def self.merge(left, right, &prc)
    prc ||= Proc.new {|num1,num2| num1 <=> num2 }
    merged_array = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when 1
        merged_array << right.shift
      when 0
        merged_array << [left,right].sample.shift
      when -1
        merged_array << left.shift
      end
    end

    merged_array + left + right
  end
end


# p [1,5,6,1,32,5,2].merge_sort
