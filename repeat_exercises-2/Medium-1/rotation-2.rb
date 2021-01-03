# Write a method that can rotate the last n digits of a number. For example:

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, rotated_digits)
  # Converting number to digit array and slicing out digits to be rotated
  digit_array = number.to_s.chars
  rotated_digits = digit_array.slice!(-(rotated_digits), rotated_digits)

  # Rotating the digits and appending them to original digit array
  rotated_digits = rotate_array(rotated_digits)
  digit_array << rotated_digits

  # Converting the rotated digit array back to an integer
  rotated_digits = digit_array.flatten.join.to_i

  rotated_digits
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

################################################################################

# LS Solution
def rotate_rightmost_digits2(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end
# 1) all_digits[-n..-1] - This construct returns the last n elements of the all_digits array. 
# 2) We pass all_digits[-n..-1] to our rotate_array method from the previous exercise, and that method returns a new array with the digits rotated as needed.
# 3) We then assign the return value of rotate_array to all_digits[-n..-1].
#    When an expression like this appears on the left side of an assignment, it means, 
#    "replace the last n elements with the values to the right of the equal sign"
#     And that's exactly what happens here: we replace the last n digits with the rotated digits.
# 4) Finally, we convert the all_digits array back to an integer.