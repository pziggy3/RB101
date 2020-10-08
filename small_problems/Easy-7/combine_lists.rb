def interleave(array_1, array_2)
  index = 0
  arr = []
  while index < array_1.size
    arr << array_1[index] << array_2[index]
    index += 1
  end

  arr
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']


# Launch School Solution
def interleave2(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end

# Zip - Converts any arguments to arrays, then merges elements of self with corresponding elements from each argument.
def interleave_zip(array1, array2)
  array1.zip(array2).flatten
end

p interleave_zip([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
