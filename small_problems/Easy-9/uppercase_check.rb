def uppercase?(string)
  string == string.upcase
end
# string.upcase converts each letter of the string to uppercase automatically

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true