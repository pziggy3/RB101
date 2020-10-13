def sum_of_sums(numbers)
  sum_total = 0
  accumulator = 0

  numbers.each do |num|
    accumulator += num
    sum_total += accumulator
  end

  sum_total
end


# Second Solution
def sum_of_sums2(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|                     # used to generate the correct size for each subset of our numbers array
    sum_total += numbers.slice(0, count).reduce(:+)   # The 2nd argument (count) is the length of the slice. We use number.slice(0, count) to get that subset, and then reduce(:+) is used on the current subset to add up all its elements
  end                                                 # For sum_of_sums([3, 5, 2])....becomes numbers.slice(0, 1) => (3)= 3 ; numbers.slice(0, 2) => (3+5) = 8 ; numbers.slice(0, 3) => (3+5+2) = 10 ====> sum_total = 21
  sum_total
end