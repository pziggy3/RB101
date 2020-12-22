# Write a method that combines two Arrays passed in as arguments,
# and returns a new Array that contains all elements from both Array
# arguments, with the elements taken in alternation.

########################################################################

# My Solution
def interleave(array_1, array_2)
  index = 0
  combined_lists = []

  loop do
    combined_lists << array_1[index]
    combined_lists << array_2[index]

    index += 1
    break if index == array_1.size
  end

  combined_lists
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

########################################################################

# L.S. Solution
def interleave2(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end

########################################################################

# Further Exploration - Take a few minutes to read about Array#zip.
#zip doesn't do the same thing as interleave, but it is very close, and more flexible.
# In fact, interleave can be implemented in terms of zip and one other method from the Array class. 
# See if you can rewrite interleave to use zip.

def interleave3(array1, array2)
  array1.zip(array2).flatten
end

p interleave3([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
