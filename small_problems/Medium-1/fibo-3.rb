# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

def fibonacci2(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

def fibonacci_last(nth)
  fibonacci2(nth).to_s.chars[-1].to_i
end

def fibonacci_last2(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  p last_2
  last_2.last
end

# To compute the last digit of the nth Fibonacci number, you only need the last digit of the nth - 1 and nth -2 numbers. 
# As a result, you only ever need the last digit of any intermediate result, which eliminates all of the computing effort needed to compute the massive numbers involved. 
# Our second solution does exactly this:
# it only computes and uses the last digit in each intermediate result, and computes the last digit of the 123,456,789th Fibonacci number in less than a minute.

p fibonacci_last2(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last2(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last2(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last2(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last2(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last2(123456789) # -> 4