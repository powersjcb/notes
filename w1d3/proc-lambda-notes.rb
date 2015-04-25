require 'byebug'

#dont use returns in procs or they break things like this:
PROC = Proc.new {return 'cats'}

def caller
  PROC.call
end

# caller(&proc)  # gives unexpected return (LocalJumpError)

#this line of code doesn't fail
# def double_nested_caller
#   def nested_caller
#     caller
#   end
#   nested_caller
# end
# double_nested_caller

# Custom sort method that is extendable with procs
class Array
  def my_sort(&prc)
    self.dup.sort!(&prc)
  end
end

# a = [1,23,4,5]
# b = a.dup
# c = a.dup
# p b.my_sort {|val1, val2| val2 <=> val1**2  }
# p c.sort!

# random each
class Array
  def random_each(&b)
    # debugger
    shuffle.each do |el|  # implied self.
      b.call el
    end
  end
end
out = []
p [1,2,3,4,5].random_each {|el| out << el}

# two procs
proc1 = Proc.new { |a| puts "#{a} cats"}
proc2 = Proc.new {puts 'rats'}
def run_two_procs(a, b)
  a.call
  b.call
end
run_two_procs(proc1,proc2)

## All the ways to call, as of 1.9
# proc1.call(10)
# proc1.(10)
# proc1[30]
# proc1 === 1

## using procs for cases
many = Proc.new { |num| num > 10 }
some = Proc.new { |num| num > 3 && num < 11 }
few  = Proc.new { |num| num < 4 }

# case testing
def case_test(many,some,few)
  result = []
  0.upto(12) do |number|
    case number
    when many
      result << 'many'
    when some
      result << 'some'
    when few
      result << 'few'
    else
      result << 'awesome'
    end
  end
  result
end

p (0..12).to_a
p case_test(many,some,few)

## lambdas
hello = proc do |a, b, c|
  puts "this is a proc"
end

hello.call

def run_a_proc(p)
  puts 'start of proc'
  p.call
  puts 'did something after calling'
end

def proc_testing  #wrapper allows proc to run with return
 run_a_proc lambda { puts "i'm a lambda"; return }
 run_a_proc proc { puts "I'm a proc"; return }
end
proc_testing


def run_proc(p)
  p.call
end


### CLOSURES

# Name is captured in the creation of the proc locally and passed along with
# the proc.  References are kept, but the values are not saved inside the proc,
# values can change dynamically.
name = "Fred"
print_a_name = proc { puts name }
run_proc print_a_name

def multiple_generator(m)
  lambda do |n|
    n*m
  end
end


name = "Bob"
run_proc print_a_name
