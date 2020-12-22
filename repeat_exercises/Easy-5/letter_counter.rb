# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

def word_sizes(string)
  # Hash values are defaulted to 0
  letter_count_hash = Hash.new(0)

  string.split.each do |word|
    letter_count_hash[word.length] += 1
  end
  letter_count_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }

# So that letter_count_hash[word.length] += 1 doesn't return an exception...
# ...we have to use the default form of initializing letter_count_hash