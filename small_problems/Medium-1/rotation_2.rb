def rotate_rightmost_digits(number, n)
  array = number.to_s.chars
  array[-n..-1] = rotate_array2(array[-n..-1])    # replace the last n elements with the values to the right of the equal sign"
  array.join.to_i
end

def rotate_array2(array)
  array[1..-1] + [array[0]]    # array[0] must be in brackets
end




rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917