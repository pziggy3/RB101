def sum_even_number_row(row_number)
  rows = []
  starting_int = 2
  row_length = 1
  until rows.length == row_number
    rows << create_row(starting_int, row_length)
    starting_int = create_row(starting_int, row_length)[-1] + 2     # starting integer of each row is the last integer of the preceding row + 2
    row_length += 1
  end
  rows[-1].inject(:+)
end

def sum_even_number_row2(row_number)
  rows = []
  start_integer = 2
  (1.. row_number).each do |current_row_number|
    rows << create_row2(start_integer, current_row_number)
    start_integer = rows.last.last + 2
  end
  final_row_sum = 0
  rows.last.each { |num| final_row_sum += num }
  final_row_sum

  # or..
  # rows.last.reduce { |final_row_sum, num| final_row_sum + num }
  
  # or..
  # rows.last.sum
end

def create_row(start_integer, row_length)
  row = []
  until row.size == row_length
    row << start_integer
    start_integer += 2
  end
  row
end

def create_row2(start_integer, row_length)
  row = []
  current_integer = start_integer
  loop do 
    row << current_integer
    current_integer += 2
    break if row.length == row_length
  end
  row
end


# Algorithm to create a row
## 1. Create an empty 'row' array to contain the integers
## 2. Add the starting integer
## 3. Increment the starting int. by 2 to get the next integer in the sequence
## 4. Repeat steps 2 and 3 until the 'row' array has reached the correct length (defined in parameter of method)
## 5. Return the 'row' array

# Algorithm to sum the even number rows
## 1. Create an empty 'rows' array to contain all the separate 'row' arrays
## 2. Create a 'row' array and add it to the overall 'rows' array
## 3. Repeat step 2 until all the necessary rows have been create
#     - All rows have been create when the length of the 'rows' array is equal to the input integer
## 4. Sum the FINAL row
## 5. Return the sum

# Test Cases
# row number: 1 ---> sum of integers in row: 2
# row number: 2 ---> sum of integers in row: 10
# row number: 4 --> sum of integers in row: 68

p sum_even_number_row(1) == 2
p sum_even_number_row(2) == 10
p sum_even_number_row(4) == 68

p sum_even_number_row2(1) == 2
p sum_even_number_row2(2) == 10
p sum_even_number_row2(4) == 68


# start 2, length: 1 --> [2]
# start 4, length: 2 --> [4, 6]
# start 8, length: 3 --> [8, 10, 12]


p create_row(2, 1) == [2]
p create_row(4, 2) == [4, 6]
p create_row(8, 3) == [8, 10, 12]

p create_row2(2, 1) == [2]
p create_row2(4, 2) == [4, 6]
p create_row2(8, 3) == [8, 10, 12]