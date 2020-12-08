# 1) Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# 1st Solution
def repeat(string, number)
  number.times { puts string }
end

repeat('Hello', 3)

# 2nd Solution
# It has to be |str| - I believe if you do |string| it counts as variable shadowing???
def repeat2(string, number)
  number.times do |str|
    puts string
  end
end

repeat2('Hello', 3)


# 3rd Solution
def repeat3(string, number)
  max = 0
  while max < number
    puts string
    max += 1
  end
end

repeat3('Hello', 3)

# L.S. Solution
def repeat4(string, number)
  number.times do
    puts string
  end
end

repeat4('Hello', 3)





