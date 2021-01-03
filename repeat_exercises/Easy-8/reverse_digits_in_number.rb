# Write a method that takes a positive integer as an argument and returns that number with its digits reversed. Examples:

########################################################################

# My Solution
def reversed_number(number)
  reverse_number = ''

  number.to_s.chars.reverse_each do |digit|
    reverse_number << digit
  end

  reverse_number.to_i
end

p reversed_number(12345)
p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

########################################################################

# LS Solution
def reversed_number(number)
  string = number.to_s
  reversed_string = string.reverse
  reversed_string.to_i
end