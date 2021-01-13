def short_long_short(string_1, string_2)
  if string_1.size > string_2.size
    string_2 + string_1 + string_2
  else
    string_1 + string_2 + string_1
  end
end

# 4 mins 

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"