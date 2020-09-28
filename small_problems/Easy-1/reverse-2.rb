def reverse_words(string)
  array = string.split

  new_array = array.map do |word|
    if word.length > 5
      word.reverse
    else
      word
    end
  end
  
  new_array.join(' ')
end


p reverse_words("Jeremiahhh is walking")
p reverse_words("hi im bob")
p reverse_words("Poopoooooo the poo")


# Solution 2
def reverse_words2(string)
  words = []

  string.split.each do |word|
    word.reverse! if word.size >= 5
    words << word
  end

  words.join(' ')
end

puts reverse_words2('Walk around the block')