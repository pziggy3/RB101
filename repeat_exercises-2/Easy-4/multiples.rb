def multiple?(number, multiple)
  number % multiple == 0
end

def multisum(n)
  multiples = []
  1.upto(n) do |num|
    multiples << num if multiple?(num, 3) || multiple?(num, 5)
  end
  multiples.reduce(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

# 5:50 - misspelled multiple