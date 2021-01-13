def word_cap(string)
  string.split.map { |word| word.capitalize }.join(' ')
end
# `capitalize` automatically downcases the rest of the string except the first

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# 2:10

######################################################################################################

# LS Solution
def word_cap2(words)
  words.split.map(&:capitalize).join(' ')
end

p word_cap2('four score and seven') == 'Four Score And Seven'
p word_cap2('the javaScript language') == 'The Javascript Language'
p word_cap2('this is a "quoted" word') == 'This Is A "quoted" Word'
