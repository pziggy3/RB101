DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

# My Solution
def signed_integer_to_string(number)
  if number > 0
    integer_to_string(number).prepend('+')
  elsif number < 0
    number = number * -1
    integer_to_string(number).prepend('-')
  else
    integer_to_string(number)
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'


# L.S. Solution
def signed_integer_to_string2(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"   # use integer_to_string on positive version of number, then add a '-'
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end

# <=> - Spaceship operator, useful when you need to know whether num is positive, negative, or 0
# returns -1 if left side is smaller than right, +1 if left side > right side, 0 if the same
 
puts signed_integer_to_string2(4321) == '+4321'
puts signed_integer_to_string2(-123) == '-123'
puts signed_integer_to_string2(0) == '0'