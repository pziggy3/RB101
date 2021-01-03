# Write a method that takes an integer as argument, and returns the maximum rotation of that argument. 

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

def max_rotation(number)
  digits_to_rotate = number.to_s.size
  digits_to_rotate.downto(2) do |num|
    number = rotate_rightmost_digits(number, num)
  end
  number
end
# Method begins by first determining how many digits we have, and then starts up a loop
# The loop repeatedly rotates the number, starting with the rightmost n digits, then the rightmost n - 1 digits, and so on, until we get down to the last 2 digits. 
# NOTE: We could also include 1 (downto(1)), but it is not needed since it does not modify the number when we rotate just the last digit.

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

################################################################################

# Further Exploration
# 1) Assume you do not have the rotate_rightmost_digits or rotate_array methods. How would you approach this problem? 
def max_rotation2(number)
  digit_array = number.to_s.chars
  digits_to_rotate = number.to_s.size

  digits_to_rotate.downto(2) do |n|
    digit_array[-n..-1] = digit_array[(-n+1)..-1] + [digit_array[-n]]
  end

  digit_array.join.to_i
end
p max_rotation2(735291) == 321579
p max_rotation2(3) == 3
p max_rotation2(35) == 53
p max_rotation2(105) == 15 # the leading zero gets dropped
p max_rotation2(8_703_529_146) == 7_321_609_845

# 2) There is an edge case in our problem when the number passed in as the argument has multiple consecutive zeros.
# Can you create a solution that preserves zeros?
# DIDNT WORK!!!!!!!
def max_rotation_preserve_zero(number)
  digit_array = number.to_s.chars
  digits_to_rotate = number.to_s.size

  digits_to_rotate.downto(2) do |n|
    digit_array[-n..-1] = digit_array[(-n+1)..-1] + [digit_array[-n]] unless digit_array[-n] == 0
  end

  digit_array.join.to_i
end
