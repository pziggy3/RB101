def reverse!(array)
  cloned_array = array.dup
  index = 0
  array.map! do |elem|
    index -= 1
    cloned_array[index]
  end
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true

# 4:44

#########################################################

# LS Solution
def reverse2!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2 
    array[left_index], array[right_index] = array[right_index], array[left_index]   # parallel assignment
    left_index += 1
    right_index -= 1
  end

  array
end
# Sets one index to point to the beginning of the array, another index to point to the end of the array,
# and then walks through the Array exchanging elements at each step.
# Note that the loop terminates at the middle of the list. If we continued, we would end up rebuilding the original array.

###### NOTE: #######
# Method has SIDE-EFFECT - mutating array passed into the method
# Method has meaningful RETURN VALUE - the mutated array
# Bad practice - methods should either have a side effect OR a meaningful return value