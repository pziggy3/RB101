# Write a method that takes an integer argument, and returns an Array of all
# integers, in sequence, between 1 and the argument.
# You may assume that the argument will always be a valid integer that is greater than 0.

########################################################################

def sequence(number)
  array = []
  1.upto(number) do |num|
    array << num
  end
  array
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

########################################################################

# Much easier
def sequence2(number)
  (1..number).to_a
end
# This simply takes advantage of Range combined with to_a which creates a range from 1 up to the value of the supplied parameter number and then converts it to an array.

########################################################################

# Further Exploration
# For instance, what should you do if the argument is -1? Can you alter your method to handle this case?
def sequence3(number)
  return (1..number).to_a unless number < 0
  return (number..1).to_a
end

p sequence3(-5)