# Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words.
# Sentences may end with periods (.), exclamation points (!), or question marks (?). 
# Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word.

text = File.read('text.txt')
sentences = text.split(/\.|\?|!/)
# When regular expressions sees a backslash, it knows that it should interpret the next character literally. 

p sentences

largest_sentence = sentences.max_by do |sentence|
  sentence.split.size
end

p largest_sentence

# puts longest_sentence.size
# puts longest_sentence
