require 'awesome_print'

def subsets(set)
  return [[]] if set.empty?
  smaller_set = set.drop(1)
  smaller_sets = subsets(smaller_set)
  larger_sets = [ ]
  smaller_sets.each do |smaller_set|
    larger_sets << smaller_set + [set.first]
  end

  smaller_sets + larger_sets
end


p subsets([])
p subsets([1])
p subsets([1,2])
p subsets([1,2,3])
# p subsets([1,2,3,4])
  # smaller_subsets = subsets(smaller_set)
  # bigger_subsets = []
  # smaller_subsets.each do |smaller_subset|
  #   bigger_subsets << smaller_subset + [set.last]
  # end
  #
  # smaller_subsets + bigger_subsets
