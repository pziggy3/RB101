# Reverse an array without using the built-in reverse method

def reverse_array(array)
  reversed_array = []
  array.reverse_each { |num| reversed_array << num }
  reversed_array
end

def reverse_array2(array)
  index = -1
  reversed_array = []
  
  loop do
    reversed_array << array[index]
    index -= 1
    break if index < -(array.size)
  end

  reversed_array
end

p reverse_array([1, 2, 3, 4]) == [4, 3, 2, 1]
p reverse_array([1, 2, 3, 4, 5]) == [5, 4, 3, 2, 1]
p reverse_array([1, 2, 3, 4, 5]) == [5, 4, 3, 2, 1] # mutating - just for fun
p reverse_array([1, 2, 3, 4]) == [4, 3, 2, 1] # mutating - just for fun

p reverse_array2([1, 2, 3, 4]) == [4, 3, 2, 1]
p reverse_array2([1, 2, 3, 4, 5]) == [5, 4, 3, 2, 1]
p reverse_array2([1, 2, 3, 4, 5]) == [5, 4, 3, 2, 1] # mutating - just for fun
p reverse_array2([1, 2, 3, 4]) == [4, 3, 2, 1] # mutating - just for fun
