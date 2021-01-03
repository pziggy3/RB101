# Write a method that rotates an array by moving the first element to the end of the array.
# The original array should not be modified.

def rotate_array(array)
  new_array = array.dup
  first_element = array.first

  new_array.delete_at(0)
  new_array + [first_element]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true