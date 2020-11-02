def rotate_array(array)
  result = []
  array[1..-1].each do |element|
    result << element
  end
  result << array[0]

  result
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']
p x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true


# L.S. Solution
def rotate_array2(array)
  array[1..-1] + [array[0]]    # array[0] must be in brackets
end