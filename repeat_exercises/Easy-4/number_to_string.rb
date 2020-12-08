# L.S. Solution - initially I tried to use `until number == 0` but that doesn't work for the 2nd test.
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

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'


########################################################

# Further Exploration
# One thing to note here is the String#prepend method; unlike most string mutating methods, the name of this method does not end with a !.
# However, it is still a mutating method - it changes the string in place.