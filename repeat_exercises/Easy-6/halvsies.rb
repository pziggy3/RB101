# Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively
# If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

def halvsies(array)
  middle = (array.size / 2.0).ceil    # "middle" is the size of half of the array
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end

# If the original array is odd in size, then the call to ceil will account for that, making the first half larger than the second by one.