# Build a program that randomly generates and prints Teddy's age.
# To get the age, you should generate a random number between 20 and 200.

########################################################################

puts "What's your name?"
name = gets.chomp

name = "Teddy" if name.empty?

age = rand(20..200)
puts "#{name} is #{age} years old!"
