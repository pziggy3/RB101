# Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create.
# The method should return an Array that contains the same number of elements as the count argument,
# while the values of each element will be multiples of the starting number.
  
# You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value.
# If the count is 0, an empty list should be returned. 

########################################################################

def sequence(count, starting_number)
  sequence = []
  number = starting_number

  count.times do
    sequence << number
    number += starting_number
  end

  sequence
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

########################################################################

def sequence2(count, starting_number)
  (1..count).map { |value| value * starting_number }
end
# Note that ranges have access to Enumerable methods, such as map
# Within the block we then simply multiply the index (that is, each number of the range) by the sequential multiplier which gives us our value for each position in the array.