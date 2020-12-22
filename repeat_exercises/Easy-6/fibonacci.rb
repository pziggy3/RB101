# Write a method that calculates and returns the index of the first
# Fibonacci number that has the number of digits specified as an
# argument. 

########################################################################

# => Parameter is a number of digits (integer)
# => Returns an index (integer)

def find_fibonacci_index_by_length(digit_length)
  prev_fibo = 1
  next_fibo = 1
  result_fibo = 0
  index = 2

  until result_fibo.to_s.size == digit_length
    index += 1

    result_fibo = prev_fibo + next_fibo
    prev_fibo = next_fibo
    next_fibo = result_fibo
  end
  
  index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847


########################################################################

# L.S. Solution
def find_fibonacci_index_by_length2(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_digits

    first = second
    second = fibonacci   
  end

  index
end