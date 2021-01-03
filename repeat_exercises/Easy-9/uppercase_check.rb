# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise.
# Characters that are not alphabetic should be ignored. 

########################################################################

def uppercase?(string)
  string.gsub!(/[^a-z]/i, '')
  string.upcase == string
end
p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

########################################################################

# You don't have to delete non-alphabetic characters b/c string#upcase doesn't affect them
def uppercase2?(string)
  return string == string.upcase unless string.empty?
  false
end
p uppercase?('4SCORE!') == true
p uppercase2?('') == false