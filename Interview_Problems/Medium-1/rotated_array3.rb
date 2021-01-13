def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

# My solution 
def max_rotation(number)
  # all_digits = number.to_s.chars
  number_digits = number.to_s.size
  # rotated_number = number
  number_digits.downto(1) do |num|    # can be 2 instead of 1 
    number = rotate_rightmost_digits(rotated_number, num)
  end
  number
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# 11:55

########################################################

# LS solution
def max_rotation(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end