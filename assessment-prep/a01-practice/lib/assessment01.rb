require 'byebug'
class Array
  def my_inject(accumulator=nil, &block)
    block       ||= Proc.new {|c,el| }
    n = 0
    if accumulator.nil?
      accumulator = self.first
      n = 1
    end
    drop(n).map do |el|
      accumulator = block.call(accumulator, el)
    end

    accumulator
  end
end

# puts [1,2,3].my_inject(1) {|c,el| c += el}



def is_prime?(num)
  (2...num).each do |div|
    return false if num % div == 0
  end

  true
end


def primes(count)
  primes = []
  num = 2
  while primes.count < count
    primes << num if is_prime?(num)
    num += 1
  end

  primes
end

# p primes(10)



# the "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
# Also, be aware that the first factorial number is 0!, which is defined
# to equal 1. So the 2nd factorial is 1!, the 3rd factorial is 2!, etc.
def factorials_rec(num)
  return [1] if num == 0
  return [1, 1] if num == 1

  last_fact = factorials_rec(num - 1)
  last_fact << num * factorials_rec(num-1).last * factorials_rec(num -2).last
end
puts factorials_rec(5)

class Array
  def dups
    # map {}
  end
end

class String
  def symmetric_substrings
  end
end

class Array
  def merge_sort(&prc)
  end

  private
  def self.merge(left, right, &prc)
  end
end
