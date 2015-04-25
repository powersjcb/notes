class Array
  def my_map(&block)
    block ||= Proc.new { }
    each do |el|
      block.call(el)
    end
  end
end

# puts [1,2,3,4].map {|el| el*2 }



def is_prime?(num)
  (2..Math.sqrt(num)).each do |div|
    return false if num % div == 0
  end
  true
end

def primes(max)
  (2..max).select {|val| is_prime?(val)}
end

def list_primes(num)
  i = 2
  list = []
  until list.count >= num
    list << i if is_prime?(i)
    i += 1
  end
  list
end

p is_prime?(5)
# p primes(10)
p list_primes(10)
