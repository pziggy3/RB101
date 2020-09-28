# Solution 1
def repeat(string, integer)
  count = 0
  until count == integer
    puts string
    count += 1
  end
end

repeat("hello", 3)

# Solution 2
def repeat2(string, number)
  number.times do
    puts string
  end
end

repeat2("Hi", 5)