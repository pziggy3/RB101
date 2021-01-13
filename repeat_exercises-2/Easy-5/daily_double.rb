def crunch(string)
  condensed_string = ''
  string.each_char do |char|
    condensed_string << char unless condensed_string[-1] == char
  end
  condensed_string
end


p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

# 1:54