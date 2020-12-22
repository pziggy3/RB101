# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. 
# The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

# My Solution
def triangle(side_length)
  side_length.downto(0) do |num|
    number_of_spaces = side_length - (side_length - num)
    number_of_stars = side_length - num

    spaces = ' ' * number_of_spaces
    stars = '*' * number_of_stars

    puts "#{spaces}#{stars}"
  end
end

triangle(5)
triangle(9)

# L.S. Solution
def triangle2(num)
  spaces = num - 1
  stars = 1

  num.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    starts += 1
  end
end


# Further Exploration - Try modifying your solution so it prints the triangle upside down from its current orientation. 
# Use upto instead of downto

# Try modifying your solution again so that you can display the triangle with the right angle at any corner of the grid
# ??????????????????