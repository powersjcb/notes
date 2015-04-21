require 'set'
# require 'byebug'

def substrings(string)
  result = []
  (0...string.length).each do |position|
    (position...string.length).each do |second_position|
      result << string[position..second_position]
    end
  end
  result
end

def subwords(string)
  dictionary = File.readlines("dictionary.txt").map(&:chomp).to_set

  substrings(string).select do |substring|
    dictionary.include?(substring)
  end
end

p substrings("cat") #== ["c", "ca", "cat", "a", "at", "t"]
p subwords('testingthings')
