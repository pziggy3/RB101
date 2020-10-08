# This solution does NOT mutate the original array object (so the arrays have diff object IDs)
def reverse(input_array)
  if input_array.empty?
    output_array = []
  else
    output_array = []
    index = input_array.length - 1      # set the index to length of array and then decrements by 1 until index reaches 0

    loop do
      output_array << input_array[index]
      index -= 1
      break if index < 0
    end
  end

  output_array
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true
p reverse([])

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true



# Launch School Solution
def reverse2(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end

# reverse_each is like each, except it processes the elements in reverse order.
# Note that unlike each, reverse_each only applies to Arrays.