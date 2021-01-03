# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array.
# You may assume that the Array always contains at least one number.

########################################################################

# My Solution
def sum_of_sums(numbers)
  new_array = []
  total = 0

  numbers.each do |num|
    new_array << num
    total += new_array.reduce { |sum, number| sum + number }
  end

  total
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

########################################################################

# L.S. Solution 1 
def sum_of_sums2(numbers)
  sum_total = 0
  accumulator = 0

  numbers.each do |num|
    accumulator += num
    sum_total += accumulator
  end

  sum_total
end

########################################################################

# L.S. Solution 2
def sum_of_sums(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|
    sum_total += numbers.slice(0, count).reduce(:+)
  end
  sum_total
end
# 1.upto(numbers.size) is used to generate the correct size for each subset of our numbers array.