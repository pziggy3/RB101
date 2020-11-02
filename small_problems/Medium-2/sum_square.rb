# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

def sum_square_difference(number)
  sum = 0
  sum_of_squares = 0

  1.upto(number) do |num|
    sum += num
    sum_of_squares += num**2
  end

  square_of_sum = sum ** 2
  difference = square_of_sum - sum_of_squares  
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150