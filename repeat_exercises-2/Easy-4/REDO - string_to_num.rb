#REDO!!!!!!!

NUMBERS = ('0'..'9').to_a

def string_to_integer(string)
  num_array = string.chars.map { |string_num| NUMBERS.index(string_num) }
  
  value = 0
  num_array.each { |digit| value = 10 * value + digit }
  value
end

p string_to_integer('4321')
p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# stopped at 14:34, didn't solve