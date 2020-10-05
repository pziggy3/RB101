DIGITS = {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
  5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
}

def integer_to_string(integer)
  arr = []
  tmp = integer

  if tmp == 0
    arr << tmp
  end
  
  while tmp > 0
    arr << tmp % 10
    tmp /= 10
  end

  arr.reverse.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'


# Launch School Solution
DIGITS2 = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string2(number)
  result = ''
  loop do
    # Prepends the reaminder to the result each time, num is divided by 10, until num is 0
    number, remainder = number.divmod(10)
    result.prepend(DIGITS2[remainder])
    break if number == 0
  end
  result
end

p integer_to_string2(4321) == '4321'
p integer_to_string2(0) == '0'
p integer_to_string2(5000) == '5000'
