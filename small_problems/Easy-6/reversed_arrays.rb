# This solution does NOT mutate the original array object (so it has a diff object ID)
def reverse!(input_array)
  output_array = []
  index = input_array.length - 1      # set the index to length of array and then decrements by 1 until index reaches 0

  loop do
    output_array << input_array[index]
    index -= 1
    break if index < 0
  end

  input_array = output_array
  input_array
end

array = %w(a b c)
p array
p array.object_id

p reverse!(array)
p reverse!(array).object_id


# Launch School solution
# This solution DOES mutate the original array object
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

p array = %w(a b c)
p array.object_id
p reverse2!(array)
p reverse2!(array).object_id
