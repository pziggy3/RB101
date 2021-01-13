def find_fibonacci_index_by_length(digit_length)
  last_fibo = 1 
  second_to_last_fibo = 1
  next_fibo = 0
  index = 2

  loop do
    index += 1
    next_fibo = last_fibo + second_to_last_fibo
    break if next_fibo.to_s.size == digit_length

    second_to_last_fibo = last_fibo
    last_fibo = next_fibo
  end

  index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847

# 11:42 - Needed to look at solution