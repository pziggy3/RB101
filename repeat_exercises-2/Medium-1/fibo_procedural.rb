# Rewrite your recursive fibonacci method so that it computes its results without recursion.
def fibonacci(nth)
  return 1 if nth <= 2
  prev_fibo = 1
  next_fibo = 1
  fibo = prev_fibo + next_fibo

  3.upto(nth) do
    fibo = prev_fibo + next_fibo
    prev_fibo = next_fibo
    next_fibo = fibo
  end

  fibo
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501


# LS Solution
def fibonacci2(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end
p fibonacci2(100_001) # => 4202692702.....8285979669707537501
# updating the array in each iteration to include the two most recent Fibonacci numbers
# This solution is extremely fast
