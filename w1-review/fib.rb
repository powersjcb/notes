require 'pry-byebug'
def fib(n)
  # 1 1 2 3 5 8
  return [ ] if n == 0
  return [1] if n == 1
  return [1,1] if n == 2
  fib_array = fib(n-1)
  fib_array << fib(n-1).last + fib(n-2).last

  fib_array
end

def fib_number(n)
  raise "not valid" if n < 1
  return 1 if n == 1 || n == 2

  fib_number(n-1) + fib_number(n-2)
end

# p fib_number(6)
# p fib(5)
