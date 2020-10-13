def sequence(count, starting_number)
  # the 'times' method would look better here
  result = []
  digit = 0
  1.upto(count) do
    digit += starting_number
    result << digit
  end
  result
end

p sequence(5, 1)
p sequence(4, -7)
p sequence(3, 0)
p sequence(0, 1000000)


# Launch School Solution 1
def sequence2(count, first)
  sequence = []
  number = first

  count.times do
    sequence << number
    number += first
  end

  sequence
end

# Launch School Solution 2
def sequence3(count, first)
  (1..count).map { |value| value * first }
end
# this creates a range from 1 to count.
# Ranges have access to Enumerable methods like map and doesn't have to be converted to an array because it'll be treated like one