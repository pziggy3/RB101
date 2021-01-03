# Write a method that returns 2 times the number provided as an argument,
# unless the argument is a double number; double numbers should be returned as-is.

########################################################################

# My Solution
def twice(number)
  return number * 2 unless double_number?(number)
  return number
end

def double_number?(number)
  string_number = number.to_s
  middle_index = (string_number.size / 2) - 1
  number.to_s.size.even? && string_number[0..middle_index] == string_number[middle_index + 1..-1]
end

p double_number?(123123)

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

########################################################################

# LS Solution
def twice2(number)
  string_number = number.to_s
  center = string_number.size / 2
  left_side = center.zero? ? '' : string_number[0..center - 1]  #edge case for single digit number
  right_side = string_number[center..-1]

  return number if left_side == right_side
  return number * 2
end