# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array.
# The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

# My Solution 1
def average(array)
  sum = 0
  array.each do |number|
    sum += number
  end
  sum / array.size
end

# My Solution 2
def average2(array)
  array.reduce { |sum, num| sum + num } / array.size
end

# My Solution 2b
def average3(array)
  average = array.reduce { |sum, num| sum + num }
  average / array.length
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

puts average2([1, 6]) == 3
puts average2([1, 5, 87, 45, 8, 8]) == 25
puts average2([9, 47, 23, 95, 16, 52]) == 40

puts average3([1, 6]) == 3
puts average3([1, 5, 87, 45, 8, 8]) == 25
puts average3([9, 47, 23, 95, 16, 52]) == 40


# L.S. Solution 1
def average4(numbers)
  sum = numbers.reduce { |sum, number| sum + number }
  sum / numbers.count
end

# L.S. Solution 2
def average5(numbers)
  numbers.reduce(:+)
end



# Further Exploration - Can you change the return value of average from an Integer to a Float?
def average6(numbers)
  sum = numbers.reduce { |sum, number| sum + number }
  sum.fdiv(numbers.count)
end

puts average6([1, 6]) 
puts average6([1, 5, 87, 45, 8, 8]) 
puts average6([9, 47, 23, 95, 16, 52])