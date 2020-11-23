# My solution
def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = -1
  while i.abs <= words.length
    reversed_words << words[i]
    i -= 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'


# L.S. Solution
def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    # Prepends each element from the words array to the reversed words array...ends up being in reverse
    # Also works: reversed_words.unshift(words[i])
    reversed_words = [words[i]] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end