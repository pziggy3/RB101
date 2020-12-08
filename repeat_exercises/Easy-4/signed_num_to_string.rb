DIGITS = ('0'..'9').to_a

def integer_to_string(number)
  result_string = ''

  loop do
    number, remainder = number.divmod(10)
    result_string.prepend(DIGITS[remainder])
    break if number == 0
  end

  result_string
end


# My Solution 1 - WRONG - doesn't work for 0
def signed_integer_to_string(number)
  case number > 0
  when true then integer_to_string(number).prepend('+')
  when false then integer_to_string(number * -1).prepend('-') 
  else integer_to_string(number)   
  end
end

# Solution 2
def signed_integer_to_string2(number)
  if number > 0
    integer_to_string(number).prepend('+')
  elsif number < 0
    integer_to_string(number*-1).prepend('-')
  else
    integer_to_string(number)
  end
end

p signed_integer_to_string2(4321) == '+4321'
p signed_integer_to_string2(-123) == '-123'
p signed_integer_to_string2(0) == '0'

######################################################################

# L.S. Solution
def signed_integer_to_string3(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"   # --123 => 123
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end

p signed_integer_to_string3(4321) == '+4321'
p signed_integer_to_string3(-123) == '-123'
p signed_integer_to_string3(0) == '0'


######################################################################

# Further Exploration - Refactor our solution to reduce the 3 integer_to_string calls to just one.

def signed_integer_to_string4(number)
  # convert number to absolute value so that `integer_to_string` works with a negative number
  string_number = integer_to_string(number.abs)

  case number <=> 0
  when -1 then string_number.prepend('-')
  when +1 then string_number.prepend('+')
  else string_number
  end
end

p signed_integer_to_string4(4321) == '+4321'
p signed_integer_to_string4(-123) == '-123'
p signed_integer_to_string4(0) == '0'