# Rewrite your recursive fibonacci method so that it computes its results without recursion.

def fibonacci(nth)
  return 1 if nth == 1 || nth == 2

  fibo_1 = 1
  fibo_2 = 1
  fibo_sum = fibo_1 + fibo_2

  position = 3
  until position == nth 
    fibo_1 = fibo_2
    fibo_2 = fibo_sum
    fibo_sum = fibo_1 + fibo_2
    position += 1
  end

  fibo_sum
end


p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765


# L.S Solution
def fibonacci2(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

# "This solution is extremely fast; it will compute the 100,001st Fibonacci number - a 20,899-digit number - in about a second. That's a huge improvement over the recursive solution."