#Problem 1: You have array of integers. Write a recursive solution to find the sum of the integers.

def sum_recur(array)
  return 0 if array.empty?
  sum_recur(array.drop(1)) + array.first
end

#Problem 2: You have array of integers. Write a recursive solution to determine
#whether or not the array contains a specific value.

def includes?(array, target)
  return false if array.empty?
  return true if array.first == target
  includes?(array.drop(1), target)
end

#Problem 3: You have an unsorted array of integers. Write a recursive solution to count the number of occurrences of a specific value.

def num_occur(array, target)
  return 0 if array.empty?
  count_update = array.first == target ? 1 : 0
  count_update + num_occur(array.drop(1), target)
end

#Problem 4: You have array of integers. Write a recursive solution to determine whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)
  return false if array.length <= 1
  return true if array[0] + array[1] == 12
  add_to_twelve?(array.drop(1))
end

#Problem 5: You have array of integers. Write a recursive solution to determine if the array is sorted.

def sorted?(array)
  return true if array.length <= 1
  return false if array[0] > array[1]
  sorted?(array.drop(1))
end

#Problem 6: Write the code to give the value of a number after it is reversed. (Don't use any #reverse methods!)

def reverse(number)
  return number if number < 10
  "#{number % 10}#{reverse(number / 10)}".to_i
end

