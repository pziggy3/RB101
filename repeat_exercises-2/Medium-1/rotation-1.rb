# Write a method that rotates an array by moving the first element to the 
# end of the array. The original array should not be modified.

################################################################################

def rotate_array(array)
  rotated_array = array.dup

  rotated_array << array.first
  rotated_array.delete_at(0)

  rotated_array
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']
x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

################################################################################

# LS Solution
def rotate_array2(array)
  array[1..-1] + [array[0]]
end

# Slices everything out of the array except the first element, then appends the
# original first element to the end. This doesn't mutate `array`

################################################################################

# Further Exploration - Write a method that rotates a string instead of an array.
# Do the same thing for integers. 
# You may use rotate_array from inside your new method.

def rotate_string(string)
  string[1..-1] + string[0]
end
p rotate_string('hello') == 'elloh'
# This works because strings are also indexed collections.


def rotate_integer(integer)
  string_integer = integer.to_s
  rotated_integer = rotate_string(string_integer).to_i
end
p rotate_integer(3567) == 5673