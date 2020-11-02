DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    word.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  words
end

# Here, we use a regex to look for a word in the string passed in and replace it with the corresponding digit.
# The word to look for is interpolated into the regex, /\b#{word}\b/.
# We use \b to limit the operation to complete words, not substrings.
# For instance, if the phrase/sentence passed into the method has the word "freight" in it, we won't replace it.
# If we don't use \b, we would convert "freight" to "fr8".

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'