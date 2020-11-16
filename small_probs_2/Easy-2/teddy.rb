"""
Build a program that randomly generates and prints Teddy's
age. To get the age, you should generate a random number
between 20 and 200.
"""

# My Solution
teddy_age = (20..200).to_a.sample
puts teddy_age

# L.S. Solution
age = rand(20..200)
puts "Teddy is #{age} years old!"

# Further Exploration
puts "What is your name?"

name = gets.chomp
name = "Teddy" if name == ''

puts "#{name} is #{age} years old!"