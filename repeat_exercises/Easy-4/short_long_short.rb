# Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again.

def short_long_short(string1, string2)
  if string1.size > string2.size
    string2 + string1 + string2
  elsif string1.size < string2.size
    string1 + string2 + string1
  else
    puts "Strings are the same size."
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"


# L.S. Solution - Less clear
# we could put string1 and string2 in an array, and then sort the array according to the element's length.
# Then just concatenate the elements in the array, knowing that the shortest one is first.

def short_long_short2(string1, string2)
  arr = [string1, string2].sort_by { |el| el.length }
  arr.first + arr.last + arr.first
end