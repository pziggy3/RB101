# My solution
def rotate_array(array)
  rotated_array = []
  rotated_array << array[1..-1] << array[0]
  rotated_array.flatten
end
# 3:58


# LS Solution
def rotate_array2(array)
  array[1..-1] + [array[0]]
end
# Slices everything out of the array except the first element, then appends the original first element to the end

p rotate_array2([1, 2, 3, 4, 5])