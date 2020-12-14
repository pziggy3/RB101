# Write a method that takes an Array as an argument, and reverses its elements in place;
# that is, mutate the Array passed into this method.
# The return value should be the same Array object.

########################################################################

# My Solution
def reverse!(list)
  # "Indexed assignment is mutating"
  list_values = []
  list.each { |elem| list_values << elem }
  

  backward_index = -1
  forward_index = 0
  until forward_index > list.length - 1
    list[forward_index] = list_values[backward_index]
    backward_index -= 1
    forward_index += 1
  end

  list
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

list = []
p reverse!(list) == []
p list == []

########################################################################

# L.S. Solution 
def reverse2!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end
# Note that the loop terminates at the middle of the list. If we continued, we would end up rebuilding the original array.
# The most interesting part of this code is the parallel assignment on line 52; this is a Ruby idiom for exchanging two values without requiring an intermediate variable. 