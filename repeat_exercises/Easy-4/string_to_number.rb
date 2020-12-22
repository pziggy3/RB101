# Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.


def string_to_integer(string)
  # Create a number hash, with string numbers as keys and integer numbers as values
  num_hash = {}
  ('0'..'9').each { |string| num_hash[string] = string.to_i }

  # String => Array of Strings. Each element is transformed to a num_hash value. Array is combined into a string and converted to an integer. 
  string.chars.map { |elem| num_hash[elem] }.join.to_i
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

####################################################################

# L.S. Solution
# Manual hash creation - does it matter that it's set to a CONSTANT?
DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer2(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

####################################################################

# Further Exploration - Write a hexadecimal_to_integer method that converts a string representing a hexadecimal number to its integer value.
def hexademical_to_integer(hex_string)
  # Creating hexadecimal hash
  num_hash = {}
  ('0'..'9').each { |string| num_hash[string] = string.to_i }
  letter_hash = {
    'A' => 10, 'B' => 11, 'C' => 12,
    'D' => 13, 'E' => 14, 'F' => 15
  }
  num_hash.merge!(letter_hash)

  # Converting each hex digit to its integer value
  # Have to use upcase to convert string to all uppercase
  digits = hex_string.upcase.chars.map { |char| num_hash[char] }

  value = 0
  power = hex_string.length - 1 
  sum_of_values = 0
  digits.each do |digit| 
    value = (16 ** power) * digit
    power -= 1
    sum_of_values += value
  end

  sum_of_values
end

p hexademical_to_integer('ABC') == 2748
p hexademical_to_integer('CBA') == 3258
p hexademical_to_integer('161') == 353
p hexademical_to_integer('4D9f') == 19871

