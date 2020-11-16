array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }

puts array1
puts array2

### What will this print????

# array1 = [Moe Larry Curly Shemp Harpo Chico Groucho Zeppo]
# array2 = [Moe Larry Curly Shemp Harpo Chico Groucho Zeppo]

# then...
# array1 = [Moe Larry CURLY SHEMP Harpo CHICO Groucho Zeppo]
# array2 = [Moe Larry CURLY SHEMP Harpo CHICO Groucho Zeppo]

# This is because the first each loop COPIES A BUNCH OF REFERENCES FROM ARRAY1 TO ARRAY2
# Now the two arrays contain both the same values AND the SAME OBJECTS

### How can this be avoided?
# change value.upcase! to value.upcase --- it doesn't modify its calling object - instead it produces a NEW array