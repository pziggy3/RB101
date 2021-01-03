# Write a method that can rotate the last n digits of a number. For example:

def rotate_array(array)
  new_array = array.dup
  first_element = array.first

  new_array.delete_at(0)
  new_array + [first_element]
end

def rotate_rightmost_digits(digit, number_of_digits)
  string_to_rotate = digit.to_s[-(number_of_digits)..-1]
  size = digit.to_s.size
  remaining_string = digit.to_s[0..(size - number_of_digits - 1)]

  array = string_to_rotate.chars 

  rotated_array = rotate_array(array)
  array_remaining = remaining_string.chars 

  final_array = array_remaining << rotated_array
  final_array.flatten.join.to_i
end

p rotate_rightmost_digits(735291, 3)


p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917