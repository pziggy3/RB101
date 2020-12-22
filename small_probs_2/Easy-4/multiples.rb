"""
Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples.
For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).
"""

# My Solution
def multisum(number)
  multiples_array = []

  (1..number).each do |num|
    multiples_array << num if (num % 3 == 0 || num % 5 == 0)
  end
  
  multiples_array.inject { |sum, number| sum + number }
end

# L.S. Solution
def multiple?(number, divisor)
  number % divisor == 0
end

def multisum2(max_value)
  sum = 0
  1.upto(max_value) do |number|
    if multiple?(number, 3) || multiple?(number, 5)
      sum += number
    end
  end
  sum
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168