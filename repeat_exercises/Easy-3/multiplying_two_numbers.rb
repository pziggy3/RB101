def multiply(n1, n2)
  n1 * n2
end

puts multiply(5, 3) == 15

# Further Exploration = what happens if the first argument is an Array? What do you think is happening here?
p multiply([6, 1], 2)
# [6, 1, 6, 1]
# Gets a big array with the elements repeated - concatenation