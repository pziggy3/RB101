# Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays

########################################################################

# My Solution
def merge(array1, array2)
  new_array = []
  array1.each { |elem| new_array << elem }
  array2.each { |elem| new_array << elem unless new_array.include? elem }

  new_array
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

########################################################################

# L.S. Solution
def merge2(array_1, array_2)
  array_1 | array_2
end

p merge2([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# In this exercise we utilize the Ruby method Array#|.
# This is a method that gives the set union of two arrays, so the result contains no duplicates
