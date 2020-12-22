# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index.
# You may assume that the arguments contain the same number of elements.

########################################################################

# My Solution
def multiply_list(array1, array2)
  multiplied_array = []
  array1.each_with_index do |number, index|
    multiplied_array << number * array2[index]
  end
  multiplied_array
end
p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

########################################################################

# Further exploration - The Array#zip method can be used to produce an extremely compact solution to this method
def multiply_list2(array1, array2)
  array1.zip(array2).map { |x, y| x * y }
end

p multiply_list2([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# This works because zip combines the two arrays into a single array of 2 element arrays 
# => [[3, 9], [5, 10], [7, 11]]
# Then you use map to multiply the elements together. This is done by iterating through each two element array and multiplying one element by the other, with map returning the resulting array.