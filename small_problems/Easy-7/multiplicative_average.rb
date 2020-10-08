def show_multiplicative_average(array)
  average = array.inject(:*).to_f / (array.size).to_f
  puts "The result is #{format('%.3f', average)}"
end

show_multiplicative_average([3, 5])
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667


# Launch School Solution
def show_multiplicative_average2(numbers)
  product = 1 # initialize product to use in the block
  numbers.each { |number| product *= number }
  average = product / numbers.size
  puts "The result is #{format('%.3f', average)}"
end

show_multiplicative_average([3, 5])
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# What happens if you omit the call to #to_f on the first line of our method? --- No changes. Im not sure why, though