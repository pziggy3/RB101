def multiply(array, multiple)
  mutliplied_numbers = []
  counter = 0

  loop do
    break if counter == array.size

    mutliplied_numbers << array[counter] *= multiple
    counter += 1
  end

  mutliplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]