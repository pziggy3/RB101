def diamond(grid_size)
  max_distance_from_center = (grid_size - 1) / 2
  max_distance_from_center.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance_from_center) { |distance| print_row(grid_size, distance) }
end

def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

diamond(9)
#  We use the variable distance to keep track of how far we are from the center row, with the center row being a distance of 0 from itself
# For each iteration, we call the print_row method. print_row uses the grid size and the distance from the center row to determine how many stars are needed, and to center those stars within our grid.
# break it down to sub-problems