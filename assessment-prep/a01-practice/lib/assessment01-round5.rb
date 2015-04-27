# 33mim
# require 'byebug'
class Array
  def my_inject(accumulator=nil, &block)
    n = 0
    if accumulator.nil?
      accumulator = self.first
      n = 1
    end

    drop(n).each do |el|
      accumulator = block.call(accumulator,el)
    end
    accumulator
  end
end




def is_prime?(num)
  (2...num).each do |i|
    return false if num % i == 0
  end
  true
end


def primes(count)
  results = []
  i = 2
  until results.count >= count
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

   last_fact = factorials_rec(num-1)
   last_fact << last_fact.last * (num - 1)
   last_fact
end


class Array
  def dups
    locations = Hash.new { |h,k| h[k] = [ ] }

    each.with_index do |el, i|
      locations[el] << i
    end
    locations.reject {|k,v| v.count < 2}
  end
end

p [1,2,1,1,1,2,2,5].dups


class String
  def symmetric_substrings
    sym = []
    (0...(self.size - 1)).each do |i1|
      (i1...(self.size)).each do |i2|
        string = self[i1..i2]
        if string.reverse == string && string.size > 2
          sym << string
        end
      end
    end
    sym.uniq
  end
end

# p "stestsersr".symmetric_substrings


class Array
  def merge_sort(&prc)
    prc = proc { |n1, n2| n1 <=> n2 }
    return self if count < 2

    left_sorted = take(count/2).merge_sort(&prc)
    right_sorted = drop(count/2).merge_sort(&prc)

    Array.merge(left_sorted, right_sorted, &prc)
  end

  private
  def self.merge(left, right, &prc)
    prc = proc { |n1, n2| n1 <=> n2 }
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

p [1,2,3,5,1,2,3,5,1,2,3,5].merge_sort
