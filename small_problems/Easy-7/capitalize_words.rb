def word_cap(string)
  # not ideal... better to use map? Although that wont work the way i wrote this method
  new = string.split.each do |word|
    word[0] = word[0].upcase
    word[1..-1] = word[1..-1].downcase
  end
  new.join(" ")
end

p word_cap('four score and seven')
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'


# Launch School solution - BETTER
def word_cap2(words)
  words_array = words.split.map do |word|
    word.capitalize
  end
  words_array.join(' ')
end

# Shorthand solution
def word_cap3(words)
  words.split.map(&:capitalize).join(' ')
end
# We can use this shorthand syntax with any method that has no required arguments.