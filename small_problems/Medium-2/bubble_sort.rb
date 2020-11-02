# Launch School Solution
def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|                                   # Iterating through the array
      next if array[index - 1] <= array[index]                          # Skip to the next set of indices if the preceding number is smaller than or equal to the following integer...swapped remains false
      array[index - 1], array[index] = array[index], array[index - 1]   # The numbers are swapped if the preceding int is greater than the following one
      swapped = true
    end

    break unless swapped                          # Only break when you havent swapped through the whole iteration thru the array. Else continue looping
  end
  nil                                             # Why use nil? You could also use 'array'
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]


array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)