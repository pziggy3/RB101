DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    # Prepends the reaminder to the result each time, num is divided by 10, until num is 0
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

def signed_integer_to_string(number)
  #  "spaceship operator - returns +1 if the left side is greater than the right, -1 if the left side is smaller than the right, and 0 if the values are the same."
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"   # --123 == 123
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
