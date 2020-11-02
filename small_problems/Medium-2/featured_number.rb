def featured(integer)
  # My initial solution - this structure doesn't allow for an error message 
  next_number = integer
  count = 0
  until next_number.odd? && next_number % 7 == 0 && next_number.to_s.chars.uniq == next_number.to_s.chars && count > 0
    next_number += 1
    count += 1
    break if next_number >= 9_876_543_210    # highest possible unique number
  end

  next_number
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987



# L.S. Solution
def featured2(number)
  number += 1
  number += 1 until number.odd? && number % 7 == 0

  loop do
    number_chars = number.to_s.split('')
    return number if number_chars.uniq == number_chars
    number += 14
    break if number >= 9_876_543_210
  end

  puts 'There is no possible number that fulfills those requirements.'
end
# Increment by 14 to ensure that the next multiple of 7 is ODD instead of EVEN

p featured2(12) == 21
p featured2(20) == 21
p featured2(21) == 35
p featured2(997) == 1029
p featured2(1029) == 1043
p featured2(999_999) == 1_023_547
p featured2(999_999_987) == 1_023_456_987
dfeatured2(9_999_999_999) # -> There is no possible number that fulfills those requirements
