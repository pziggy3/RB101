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

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# 5:40