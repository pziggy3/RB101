def triangle(side_length)
  spaces = side_length - 1
  stars = 1

  side_length.times do
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1 
    stars += 1
  end
end

triangle(5)
triangle(9)

# 5:51

# Further Exploration - Try modifying your solution so it prints the triangle upside down from its current orientation
def triangle_flip(side_length)
  spaces = 0
  stars = side_length

  side_length.times do
    puts (' ' * spaces) + ('*' * stars)
    spaces += 1 
    stars -= 1
  end
end

triangle_flip(5)
triangle_flip(9)
