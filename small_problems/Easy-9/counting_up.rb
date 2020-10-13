def sequence(number)
  result = []
  1.upto(number) do |digit|
    result << digit
  end
  result
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]


# Launch School Solution - BETTER
def sequence2(number)
  (1..number).to_a
end