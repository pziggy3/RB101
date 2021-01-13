def show_multiplicative_average(array)
   mult_avg = '%.3f' % array.inject(:*).fdiv(array.size)
   puts "The result is #{mult_avg}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# 4:08

####################################################

# LS Solution
def show_multiplicative_average2(numbers)
  product = 1.to_f
  numbers.each { |number| product *= number }
  average = product / numbers.size
  puts "The result is #{format('%.3f', average)}"
end

show_multiplicative_average2([3, 5])                # => The result is 7.500
show_multiplicative_average2([6])                   # => The result is 6.000
show_multiplicative_average2([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
