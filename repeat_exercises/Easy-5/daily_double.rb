# Write a method that takes a string argument and returns a new string that
# contains the value of the original string with all consecutive duplicate
# characters collapsed into a single character. 


################################################################################

def crunch(string)
  clean_string = []

  string.each_char do |char|
    clean_string << char unless clean_string.last == char
  end

  clean_string.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''


################################################################################

# L.S. Solution
def crunch2(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    # add character to crunch_text unless the NEXT character is the same as that character
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

################################################################################

# Further Exploration - Can you determine why we didn't use String#each_char or String#chars to iterate through the string?
# ????????????????? something to do with an issue iterating through a string and needing to convert it to an array 