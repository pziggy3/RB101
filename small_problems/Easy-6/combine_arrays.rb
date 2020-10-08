def merge(array1, array2)
  array1 << array2
  array1.flatten.uniq
end

p merge([1, 3, 5], [3, 6, 9]) 
p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]


# Launch School Solution
def merge2(array_1, array_2)
  array_1 | array_2
end

"""
In this exercise we utilize the Ruby method Array#|.
This is a method that gives the set union of two arrays, so the result contains no duplicates.
It works perfectly for our merge method
"""