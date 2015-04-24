require 'byebug'
def recursion_1(b,n)
  return 1 if n == 0

  b * recursion_1(b, n-1)
end

def recursion_2(base,power)
  return 1                                               if power == 0
  return recursion_2( base, (power / 2 ))**2             if power.even?
  return base * recursion_2(base, ((power - 1) / 2) )**2 if power.odd?
end



puts 'test 1'
p recursion_1(2,3) == 8
puts 'test 2'
p recursion_2(2,3) == 8
