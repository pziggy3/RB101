def reverse(array)
  cloned_array = array.dup
  index = 0
  array.map do |elem|
    index -= 1
    cloned_array[index]
  end
end

def reverse2(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

# 1:45

# Further Exploration
def reverse3(array)
  reversed_index = -1
  result = array.each_with_object([]) do |element, result|
    result << array[reversed_index]
    reversed_index -=1
  end

  result
end

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse3(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true