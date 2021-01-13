NUMBERS = ('0'..'9').to_a

def integer_to_string(number)
  string_number = ''
  loop do
    number, remainder = number.divmod(10)
    string_number.prepend(NUMBERS[remainder])
    break if number == 0
  end
  string_number
end

def signed_integer_to_string(number)  
  if number > 0
    '+' + integer_to_string(number)
  elsif number < 0
    number *= -1
    '-' + integer_to_string(number)
  else
    '0'
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

# 3:05