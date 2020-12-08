def string_to_integer(string)
  # Create a number hash, with string numbers as keys and integer numbers as values
  num_hash = {}
  ('0'..'9').each { |string| num_hash[string] = string.to_i }

  # String => Array of Strings. Each element is transformed to a num_hash value. Array is combined into a string and converted to an integer. 
  string.chars.map { |elem| num_hash[elem] }.join.to_i
end

def string_to_signed_integer(string)
  case string[0]
  when '-'
    string_to_integer(string.delete('-')) * -1
  when '+'
    string_to_integer(string.delete('+'))
  else
    string_to_integer(string)
  end
end

# puts string_to_signed_integer('4321') == 4321
# puts string_to_signed_integer('-570') == -570
# puts string_to_signed_integer('+100') == 100


##################################################################

# L.S. Solution
def string_to_signed_integer2(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

##################################################################

# Further Exploration - In our solution, we call string[1..-1] twice, and call string_to_integer three times.
# This is somewhat repetitive. Refactor our solution so it only makes these two calls once each.
def string_to_signed_integer3(string)
  string_subset_integer = string_to_integer(string[1..-1])

  case string[0]
  when '-' then -string_subset_integer
  when '+' then string_subset_integer
  else     string_subset_integer.to_s.prepend(string[0]).to_i
  end
end

puts string_to_signed_integer3('4321') == 4321
puts string_to_signed_integer3('-570') == -570
puts string_to_signed_integer3('+100') == 100