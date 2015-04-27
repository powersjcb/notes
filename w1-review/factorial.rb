require 'pry-byebug'
def factorial_array(num)
  # binding.pry
  return [] if num == 0
  return [1] if num == 1

  fact = factorial_array(num-1)
  fact << fact.last * (num - 1)

end

def factorial(n)
  return 1 if n == 0 || n == 1

  n*factorial(n-1)
end

p 10.times { |n| puts factorial(n) }


# p factorial_array(3)
# fact(1) => [1]
# fact(4) => [1,1,2,6]
