def twice(number)
  half = number.to_s.size / 2
  if number.to_s.size.even?
    if number.to_s.slice(0, half) == number.to_s.slice(half, half)
      number
    else
      number * 2
    end
  else
    number * 2
  end
end

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


# Launch School Solution
def twice2(number)
  string_number = number.to_s
  center = string_number.size / 2
  left_side = center.zero? '' : string_number[0..center - 1]    # if center index isn't 0, this gets the left side of the string number
  right_side = string_number[center..-1]                        # gets the right side of the string number

  return number if left_side == right_side
  return number * 2
end