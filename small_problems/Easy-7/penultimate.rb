def penultimate(string)
  string.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'


# Launch School Solution
def penultimate(words)
  words_array = words.split
  words_array[-2]
end