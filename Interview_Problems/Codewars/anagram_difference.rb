# My Solution
def anagram_difference(w1, w2)
  intersection = w1.chars & w2.chars
  (w1.size + w2.size) - (2 * intersection.size)
end
# Fails Random tests?????????????

# Codewars