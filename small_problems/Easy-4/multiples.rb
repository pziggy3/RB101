def multisum(num)
  array = (1..num).to_a
  array.select! { |num| num % 3 == 0 || num % 5 == 0}

  array.reduce(:+)
  # array.reduce { |sum, n| sum + n}
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168


# Launch School Solution
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

puts multisum2(3) == 3
puts multisum2(5) == 8
puts multisum2(10) == 33
puts multisum2(1000) == 234168


# NOTE: upto(limit){|i|block} ==> self
# Iterates the given block, passing in integer values from int up to and including limit.
# If no block is given, an Enumerator is returned instead.