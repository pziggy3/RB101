# Write a method that displays a 4-pointed diamond in an n x n grid, 
# where n is an odd integer that is supplied as an argument to the method. 

# Messy and repetitive 
def diamond(n)
  half_of_rows = n / 2
  number_of_spaces = half_of_rows
  spaces = ' ' * number_of_spaces
  number_of_stars = n - (half_of_rows * 2)
  stars = '*' * number_of_stars
  
  # Top half
  half_of_rows.downto(1) do |num|   
    puts "#{spaces}#{stars}#{spaces}"
    number_of_stars += 2
    stars = '*' * number_of_stars
    number_of_spaces -= 1
    spaces = ' ' * number_of_spaces
  end

  # Center
  puts '*' * n

  # Bottom half
  1.upto(half_of_rows) do
    number_of_stars -= 2
    number_of_spaces += 1
    stars = '*' * number_of_stars 
    spaces = ' ' * number_of_spaces
    puts "#{spaces}#{stars}#{spaces}"
  end
end

diamond(9)

# LS Solution
def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - (2 * distance_from_center)
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end
# For each iteration, we call the print_row method.
# print_row uses the grid size and the distance from the center row to determine how many stars are needed, and to center those stars within our grid.

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end
#  We use the variable distance to keep track of how far we are from the center row