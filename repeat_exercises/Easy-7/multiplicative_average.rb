# Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

########################################################################

def show_multiplicative_average(array)
  result = array.inject(:*) / (array.size.to_f)
  puts "The result is #{format('%.3f', result)}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

########################################################################

# L.S. Solution
def show_multiplicative_average2(numbers)
  product = 1.to_f
  numbers.each { |number| product *= number }
  average = product / numbers.size
  puts "The result is #{format('%.3f', average)}"
end

show_multiplicative_average2([3, 5])                # => The result is 7.500
show_multiplicative_average2([6])                   # => The result is 6.000
show_multiplicative_average2([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

########################################################################

# Further exploration - What happens if you omit the call to #to_f on the first line of our method?
# 7.000
# 6.000
# 28361.000