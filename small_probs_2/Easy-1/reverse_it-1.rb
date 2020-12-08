"""
Write a method that takes one argument, a string, and 
returns a NEW STRING with the words in reverse order.
"""

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

# 'split' splits by word, join(' ') join the words with a space

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'