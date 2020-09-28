def stringy(integer)
  poo = []

  integer.times do |num|
    # times starts counting from 0
    poo << 0 if num % 2 == 1
    poo << 1 if num % 2 == 0
  end

  poo.join
end

p stringy(6)
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# Solution 2 (better)

def stringy2(integer)
  numbers = []

  integer.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

p stringy2(6)