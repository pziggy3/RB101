# My Solution
puts "What is the length of the room in meters?"
length = gets.chomp.to_i

puts "What is the width of the room in meters?"
width = gets.chomp.to_i

square_meters = length * width
square_feet = square_meters * 10.7639

puts "The area of the room is #{square_meters} square meters (#{square_feet} square feet)."


# L.S. Solution
SQMETERS_TO_SQFEET = 10.7639
# "We use a constant, SQMETERS_TO_SQFEET to store the conversion factor between square meters and square feet."
# "This is good practice any time you have a number whose meaning is not immediately obvious upon seeing it."

puts '==> Enter the length of the room in meters: '
length = gets.to_f

puts '==> Enter the width of the room in meters: '
width = gets.to_f

square_meters = (length * width).round(2)
square_feet = (square_meters * SQMETERS_TO_SQFEET).round(2)

puts "The area of the room is #{square_meters} " + \
     "square meters (#{square_feet} square feet)."