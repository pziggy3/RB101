# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument.
# The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

def oddities(array)
  new_array = []
  array.each_with_index do |num, index|
    new_array << num if index.even?
  end
  new_array
end

def oddities2(array)
  odd_elemnts = []
  index = 0
  while index < array.size
    odd_elemnts << array[index]
    index += 2
  end
  odd_elemnts
end

def oddities3(array)
  index = 0
  nnew = []
  array.map do |num|
    nnew << num if index.even?
    index += 1
  end
  nnew
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

puts oddities2([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities2([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities2(['abc', 'def']) == ['abc']
puts oddities2([123]) == [123]
puts oddities2([]) == []

puts oddities3([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities3([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities3(['abc', 'def']) == ['abc']
puts oddities3([123]) == [123]
puts oddities3([]) == []