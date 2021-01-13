def penultimate(string)
  string.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# 42 secs 

###################################################
# Further Exploration = Write a method that returns the middle word of a phrase or sentence
def middle(string)
  array = string.split
  middle = array.size / 2
  return array[middle-1, 2].join(' ') if array.size.even?
  return array[middle] if array.size.odd?
end
p middle('Launch School is great!')
p middle('Launch School pee poo great!')