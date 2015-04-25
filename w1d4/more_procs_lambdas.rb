require 'byebug'

def amp_makes_block_a_proc(&prc)
  prc.class
end

puts amp_makes_block_a_proc { |x| x+1 }
puts amp_makes_block_a_proc

my_proc = proc { puts 'This proc is converted to a block and then back to proc' }

def caller(&prc)
  prc.class
end
p caller(&my_proc)

def block_caller(block)
  puts block
  yields block
end

p block_caller {}
