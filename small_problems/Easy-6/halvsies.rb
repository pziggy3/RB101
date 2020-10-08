def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end


# The ceil function in Ruby returns the smallest number greater than or equal to int with a precision of ndigits decimal digits. The default is considered to be 0.
# We first get the middle, which is more exactly the size of the first half, by dividing the original array's size by two.
# If the original array is odd in size, then the call to ceil will account for that, making the first half larger than the second by one.
# slice takes two arguments: the first one is the starting index and the second one is the length of the slice.
# For the second half, we can use our middle value as the starting index and specify a length that includes any remaining elements left in the original array after we removed the first half.

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]