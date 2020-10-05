def word_sizes(string)
  arr = []
  string.split.each do |word|
    arr << word.size
  end

  hash = Hash[arr.map { |v| [v, arr.count(v)] }]    # "collect" is an alias for "map"
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

"""
- separate words in array
- iterate the array + count the length of each word
- create a hash that uses the unique lengths as keys
"""


# Launch School Solution 
def word_sizes2(words_string)
  counts = Hash.new(0)                # This forces any references to non-existing keys in counts to return 0.
  words_string.split.each do |word|
    counts[word.size] += 1            # key is word.size; value is count
  end
  counts
end

p word_sizes('Four score and seven.')