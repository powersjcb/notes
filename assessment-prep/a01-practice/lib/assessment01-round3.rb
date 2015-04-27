# require 'byebug'
class Array
  def my_inject(accumulator=nil, &block)
    n = 0
    if accumulator.nil?
      accumulator = self.first
      n = 1
    end
    self.drop(n).each { |el| accumulator = block.call(accumulator, el) }

    accumulator
  end
end




def is_prime?(num)
  return false if num == 1 || num == 0
  (2...num).each { |divisor| return false if num % divisor == 0 }
  true
end




def primes(count)
  output = []
  i = 0
  while output.size < count
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

  fact = factorials_rec(num-1)
  fact << factorials_rec(num-1).last * (num - 1)
  fact
end



class Array
  def dups
    results = Hash.new([])
    each.with_index do |el, index|
      results[el] += [index]
    end

    results.reject! { |k, v| v.count < 2 }
  end
end

p [1,2,3,1,1,2].dups

class String
  def symmetric_substrings
    sym_string = [ ]
    length.times do |i1|
      (i1..self.length).each do |i2|
        string = self[i1..i2]
        sym_string <<
          string if string.reverse == string && string.length > 2
      end
    end
    sym_string.uniq
  end
end

p 'stetssdafsdfd'.symmetric_substrings

class Array
  def merge_sort(&prc)

    return self if count < 2
    left, right = self.take(count/2), self.drop(count/2)

    Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end

  private
  def self.merge(left, right, &prc)
    prc ||= Proc.new { |n1,n2| n1 <=> n2 }
    merged = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when 1
        merged << right.shift
      when 0
        merged << [left,right].sample.shift
      when -1
        merged << left.shift
      end
    end

    merged + left + right
  end
end
