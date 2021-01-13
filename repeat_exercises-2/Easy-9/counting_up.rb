def sequence(n)
  1.upto(n).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

# 44 secs

############################################################


# LS Solution
def sequence2(number)
  (1..number).to_a
end
# Takes advantage of Range combined with to_a which creates a range from 1 up to the value of the supplied parameter `number` and then converts it to an array


############################################################

# Further exploration - do you think sequence should return if the argument is not greater than 0. 
def sequence3(number)
  number > 0 ? (1..number).to_a : (number..1).to_a
end

p sequence3(-5)