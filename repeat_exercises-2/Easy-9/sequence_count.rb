def sequence(count, start_number)
  multiples = []
  1.upto(count) do |iteration|
    multiples << start_number * iteration
  end
  multiples
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

###################################################33

# LS Solution
def sequence2(count, first)
  sequence = []
  number = first

  count.times do
    sequence << number
    number += first
  end

  sequence
end
# Integer#times method. It will execute the content of the block the number of times specified by the integer
# on each iteration, we first append number to our sequence array and then increment number by the value of first

def sequence3(count, first)
  (1..count).map { |value| value * first }
end
# Note that ranges have access to Enumerable methods, such as map.
# You don't need to convert it to an array before, it will be treated as one