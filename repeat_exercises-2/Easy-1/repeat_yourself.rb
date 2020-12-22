# Solution 1
def repeat(string, number)
  number.times do
    puts string
  end
end
repeat('Hello', 3)

########################################################################

# Solution 2 
def repeat2(string, number)
  number.times do |word|
    puts string
  end
end
repeat2('Hello', 3)

########################################################################

# Solution 3
def repeat3(string, number)
  number.times { |word| puts string }
end
repeat3('Hello', 3)

########################################################################

# Solution 4
def repeat4(string, number)
  number.times { puts string }
end
repeat4('Hello', 3)

########################################################################

# WRONG SOLUTION
def repeat5(string, number)
  number.times do |word|
    puts word
  end
end
repeat5('Hello', 3)
# 0 1 2 


