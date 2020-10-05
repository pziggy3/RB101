def short_long_short(string1, string2)
  if string1.size > string2.size
    string2.concat(string1, string2)
  elsif string1.size < string2.size
    string1.concat(string2, string1)
  else
    puts 'Strings are the same length :/'
  end
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
