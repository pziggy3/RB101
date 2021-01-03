<<<<<<< HEAD
def test
  puts "written assessment"
end

var = test

if var
  puts "written assessment"
else
  puts "interview"
end
=======
def test(str)
  str  += '!'
  str.downcase!
end

test_str = 'Written Assessment'
puts test(test_str)

puts test_str

###############################################

"""
people = {}
people.sort_by do |_, age|
  age
end
"""

# The local variable `people` initialized and assigned to (points to or references) a hash object containing 3 key,value pairs.
# The sort_by method is called on the local variable `people`, and we are passing to this method a `do..end` block with 2 parameters
# ...as an argument. Each key,value pair in the local variable `people` is passed to the block and assigned to the block parameters `-` and `age` as arguments to the block.
# For each key/value pair passed to the block, the block and runs and returns `age`
# The sort_by method uses the last argument evaluated in the block (`age`) to sort the the local variable people and
# returns a new nested array (a different object) with the key-value pairs as objects in the nested array.
>>>>>>> 04912b696f5a8c04bfa0235f1bba74d8c71f16e7
