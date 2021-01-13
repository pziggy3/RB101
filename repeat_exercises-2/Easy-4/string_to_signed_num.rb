NUMBERS = ('0'..'9').to_a

def string_to_integer(string)
  num_array = string.chars.map { |string_num| NUMBERS.index(string_num) }
  
  value = 0
  num_array.each { |digit| value = 10 * value + digit }
  value
end

def string_to_signed_integer(string)
  if string.start_with?('-')
    string_to_integer(string[1..-1]) * -1
  elsif string.start_with?('+')
    string_to_integer(string[1..-1])
  else
    string_to_integer(string)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

# 2:41