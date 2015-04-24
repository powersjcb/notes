def fib_to_array(n)
  return [1] if n == 1
  return [1, 1] if n == 2
  last_fib = fib_to_array(n-1)
  last_fib << last_fib[-1] + last_fib[-2]
end


p fib_to_array(5)
