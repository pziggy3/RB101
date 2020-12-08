DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  # take each digit and add it to 10 times the previous value
  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

p string_to_integer('4321')
puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570