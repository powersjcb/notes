# require 'byebug'
class Array
  def my_inject(accumulator=nil, &block)
    n = 0
    if accumulator.nil?
      accumulator = self.first
      n = 1
    end
    self.drop(n).each do |el|
      accumulator = block.call(accumulator,el)
    end

    accumulator
  end
end



# array = self
# if !accumulator.nil?
#   array = [accumulator].unshift(array)
# end


def is_prime?(num)
  (2...num).none? {|i| num % i == 0 }
end


def primes(count)
  primes = [ ]
  i = 2
  until primes.size >=count
    primes << i if is_prime?(i)
    i += 1
  end
  primes
end

# the "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
# Also, be aware that the first factorial number is 0!, which is defined
# to equal 1. So the 2nd factorial is 1!, the 3rd factorial is 2!, etc.
def factorials_rec(num)
  return [] if num == 0
  return [1] if num == 1
  fact = factorials_rec(num-1)
  fact << fact.last*(num-1)
  fact
end



class Array
  def dups
    duplicates = Hash.new([])
    each.with_index do |el, i|
      duplicates[el] += [i]
    end
    duplicates.reject {|k,v| v.length < 2}
  end
end


class String
  def symmetric_substrings
    sym_strings = []
    self.chars.each_index do |i1|
      ((i1+1)...self.length).each do |i2|
        string = self[i1..i2]
        sym_strings << string if string.reverse == string
      end
    end
    sym_strings.uniq
  end
end

p 'stetssdafsdfd'.symmetric_substrings

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |n1, n2| n1 <=> n2 }

    return self if count < 2

    left  = take(count/2).merge_sort(&prc)
    right = drop(count/2).merge_sort(&prc)

    Array.merge(left, right, &prc)

  end

  private
  def self.merge(left, right, &prc)
    merged_array = [ ]

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

p [5,4,3,2,5,1].merge_sort
