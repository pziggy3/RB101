matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

def transpose(matrix)
  result = []
  (0..2).each do |column_index|
    # This iterates all the rows of a single column before moving to the next column, to make a new row.
    new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  result
end

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]



# CREATE 2D ARRAY
# https://stackoverflow.com/questions/1720932/create-two-dimensional-arrays-and-access-sub-arrays-in-ruby
# rows, cols = x,y  # your values
# grid = Array.new(rows) { Array.new(cols) }
# DOESNT WORK??????????????????????????????????????
# rows, cols = [ [1, 2, 3], [4, 5, 6] ]
# p rows 
# p cols
# grid = Array.new(rows) { Array.new(cols) }
# p grid

p Array.new(4) { Array.new(4,0) }
# https://www.thoughtco.com/two-dimensional-arrays-in-ruby-2907737