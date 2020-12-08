# Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.


def string_to_integer(string)
  num_hash = {}
  ('0'..'9').each { |string| num_hash[string] = string.to_i }

  string.chars.map { |elem| num_hash[elem] }.join.to_i
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570


# L.S. Solution
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


# Further Exploration - Write a hexadecimal_to_integer method that converts a string representing a hexadecimal number to its integer value.
def hexademical_to_integer(hex_string)
  num_hash = {}
  ('0'..'9').each { |string| num_hash[string] = string.to_i }
  letter_hash = {
    'A' => 10, 'B' => 11, 'C' => 12,
    'D' => 13, 'E' => 14, 'F' => 15
  }
  num_hash.merge(letter_hash)

  digits = hex_string.chars.map { |char| num_hash[char] }

  value = 0
  power = hex_string.length - 1 
  digits.each do |digit| 
    value = (16 ** power) * digit
  

end