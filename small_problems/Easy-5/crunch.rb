def crunch(string)
  crunch_text = []
  string.chars.each do |char|
    crunch_text << char unless crunch_text.last == char
  end

  crunch_text.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''


# Launch School Solution
def crunch2(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1   #(while index is less than the length of the text)
    crunch_text << text[index] unless text[index] == text[index + 1]  # dont add a new char if the NEXT char is a duplicate of this one
    index += 1
  end
  crunch_text
end

p crunch2('ddaaiillyy ddoouubbllee')
p crunch2('4444abcabccba')