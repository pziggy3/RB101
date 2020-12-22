"""
Write a method that takes two strings as arguments,
determines the longest of the two strings, and then
returns the result of concatenating the shorter string, the longer string,
and the shorter string once again.
You may assume that the strings are of different lengths.
"""

# My Solution - could have been shorter
def short_long_short(string_1, string_2)
  if string_1.size > string_2.size
    longest_string = string_1
    shortest_string = string_2
  else
    longest_string = string_2
    shortest_string = string_1
  end
  shortest_string + longest_string + shortest_string
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"

# L.S. Solution
def short_long_short2(string1, string2)
  if string1.length > string2.length
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end

# L.S. Solution2
# A little too clever? Makes if difficult to understand what method is trying to do
def short_long_short3(string1, string2)
  arr = [string1, string2].sort_by { |el| el.length }
  arr.first + arr.last + arr.first
end