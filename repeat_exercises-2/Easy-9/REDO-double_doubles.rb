def twice(n)
  num_string = n.to_s
  center_index = num_string.size / 2
  return n if num_string.size.even? && num_string[0, center_index] == num_string[center_index..-1]
  return 2 * n
end
# Uses 2 different ways to get half of the string...not the best style

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

# 8:02

##########################################################3

# LS Solution - longer but clearer 
def twice2(number)
  string_number = number.to_s
  center = string_number.size / 2
  left_side = center.zero? ? '' : string_number[0..center - 1]  # Edge case for single digit numbers
  right_side = string_number[center..-1]

  return number if left_side == right_side
  return number * 2
end