# 33mim
# require 'byebug'
class Array
  def my_inject(accumulator=nil, &block)
    n = 0
    if accumulator.nil?
      accumulator = self.first
      n=1
    end
    drop(n).each do |el|
      accumulator = block.call(accumulator,el)
    end

    accumulator
  end
end




def is_prime?(num)
  (2...num).each { |i| return false if num % i == 0}
  true
end


def primes(count)
  i = 2
  results = []
  while results.size < count
    results << i if is_prime?(i)

    i += 1
  end

  results
end

# the "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
# Also, be aware that the first factorial number is 0!, which is defined
# to equal 1. So the 2nd factorial is 1!, the 3rd factorial is 2!, etc.
def factorials_rec(num)
  return [1] if num == 1

  facts = factorials_rec(num-1)

  facts << facts.last * (num - 1)

  facts
end


class Array
  def dups
    duplicates = Hash.new { |h,k| h[k] = [] }
    each.with_index do |el, i|
      duplicates[el] << i
    end

    duplicates.reject {|k,v| v.size < 2}
  end
end


class String
  def symmetric_substrings
    syms = []

    (0...length).each do |i1|
      (i1..length).each do |i2|
        string = self[i1..i2]
        syms << string if string.reverse == string && string.size > 2
      end
    end

    syms.uniq
  end
end

# p "testst".symmetric_substrings


class Array
  def merge_sort(&prc)
    prc ||= Proc.new {|n1,n2| n1 <=> n2}
    return [] if empty?
    return self if one?

    left_sorted = self.take(size/2).merge_sort(&prc)
    right_sorted = self.drop(size/2).merge_sort(&prc)


    Array.merge(left_sorted, right_sorted, &prc)
  end

  private
  def self.merge(left, right, &prc)
    prc ||= Proc.new { |n1,n2| n1 <=> n2 }
    merged_array = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when 1
        merged_array << right.shift
      when 0
        merged_array << [right, left].sample.shift
      when -1
        merged_array << left.shift
      end
    end
    merged_array + left + right
  end
end
