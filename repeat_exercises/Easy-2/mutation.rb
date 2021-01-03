# What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# Moe
# Larry
# CURLY
# SHEMP
# Harpo
# CHICO
# Groucho
# Zeppo
# How'd those changes end up in array2 as well?
# 1) the first each loop simply copies a bunch of references from array1 to array2.
# 2) When that first loop completes, both arrays not only contain the same values, they contain the SAME STRING OBJECTS. 
# 3) If you modify one of those Strings, that modification will show up in both Arrays. 