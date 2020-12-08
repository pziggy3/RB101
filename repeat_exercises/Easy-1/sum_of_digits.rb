# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

# My Solution 1 
def sum_of_digits(number)
  number.to_s.chars.map(&:to_i).reduce { |sum, num| sum + num }
end

puts sum_of_digits(23) == 5
puts sum_of_digits(496) == 19
puts sum_of_digits(123_456_789) == 45

# My Solution 2
def sum_of_digits2(number)
  number.to_s.chars.map { |char| char.to_i }.reduce { |sum, num| sum + num }
end

puts sum_of_digits2(23) == 5
puts sum_of_digits2(496) == 19
puts sum_of_digits2(123_456_789) == 45


# L.S. Solution 1
def sum(numbers)
  sum = 0
  # we assign this array to a variable named str_digits.
  str_digits = number.to_s.chars

  # We then iterate over our array and, on each iteration, increment the sum by the given digit converted back to an integer.
  str_digits.each do |str_digit|
    sum += str_digit.to_i
  end

  sum
end