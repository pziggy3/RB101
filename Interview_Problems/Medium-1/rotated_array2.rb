# MY solution - MESSY + convoluted
def rotate_rightmost_digits(number, digits)
  string_number = number.to_s
  length = string_number.length
  
  to_be_rotated = string_number[-digits..-1]
  rotated_digits = to_be_rotated[1..-1] + to_be_rotated[0]
  
  not_rotated = string_number[0, (length - rotated_digits.length)]
  
  (not_rotated << rotated_digits).to_i
end

# 15:46

##################################################

# LS Solution
def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end