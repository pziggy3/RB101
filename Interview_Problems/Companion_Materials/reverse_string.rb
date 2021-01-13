# Reverse a string, without using String#reverse

def string_reverser(string)
  reversed_string = ''
  index = -1
  loop do
    reversed_string << string[index]
    index -= 1
    break if index < -(string.size)
  end
  reversed_string
end
p string_reverser('hello') == 'olleh'
p string_reverser('Launch School') == 'loohcS hcnuaL'
