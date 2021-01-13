# You are given array of integers, your task will be to count all pairs in that array and return their count.

# Notes:
#     Array can be empty or contain only one value; in this case return 0
#     If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
#     Random tests: maximum array length is 1000, range of values in array is between 0 and 1000

################################################################################

# My Solution
def pairs(arr)
  pairs = 0
  arr.uniq.each do |num|
    pairs += arr.count(num) / 2 
  end
  pairs
end

################################################################################

# Top solution
def pairs2(arr)
  arr.group_by { |x| x }.sum { |x, y| y.size / 2 }
end
# x and y are the key and value {1=>[1, 1], 2=>[2,2,2,2]}
# .sum (1, 2) => 3

################################################################################

# group_by()
# Groups the collection by result of the block. Returns a hash where the keys are the evaluated result from the block and the values are arrays of elements in the collection that correspond to the key
# (1..6).group_by { |i| i%3 }   #=> {0=>[3, 6], 1=>[1, 4], 2=>[2, 5]}.
