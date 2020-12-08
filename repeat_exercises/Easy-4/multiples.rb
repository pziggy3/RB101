# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples.

# My Solution
def multisum(number)
  mutliples_array = []
  1.upto(number) do |num|
    mutliples_array << num if num % 3 == 0 || num % 5 == 0
  end

  mutliples_array.reduce { |sum, num| sum + num }
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168


# L.S. Solution - splits problem into 2 methods
# returns true if the given number is an exact multiple of divisor, false if it's not.
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