# Write a method that returns a list of all substrings of a string that start at the beginning of the original string.
# The return value should be arranged in order from shortest to longest substring.

########################################################################

# My Solution
def leading_substrings(string)
  substring_array = []
  building_string = ''

  string.chars.each do |letter|
    building_string += letter
    substring_array << building_string
  end

  substring_array
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

########################################################################

# L.S. Solution
def leading_substrings2(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

# The expression string[0..index] simply returns a substring of string.
# The substring starts at position 0, and ends at position index.