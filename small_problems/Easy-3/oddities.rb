def oddities(array)
  # NOTE: using the each iterator may not be ideal because you dont want to iterate through each element, you just want to use every other element
  # This is why using a while loop may be better
  odd_elements = []
  index = 0

  array.each do |n|
  if index.even?
    odd_elements << n
  end

  index += 1
  end

  odd_elements
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]

# Launch School solution
def oddities2(array)
  odd_elements = []
  index = 0
  while index < array.size
    odd_elements << array[index]
    index += 2
  end 
  odd_elements
end

puts oddities2([2, 3, 4, 5, 6]) == [2, 4, 6]
