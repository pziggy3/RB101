puts "Length (in meters)?"
length = gets.to_i

puts "Width (in meters)?"
width = gets.to_i

square_meters = length * width
square_feet = square_meters * 10.7639

puts "The area of the room is #{square_meters} square meters (#{square_feet} square feet)."


# Launch School Solution
SQMETERS_TO_FEET = 10.7639

puts '==> Enter the length of the room in meters: '
length = gets.to_f

puts '==> Enter the width of the room in meters: '
width = gets.to_f

square_meters = (length * width).round(2)
square_feet = (square_meters * SQMETERS_TO_FEET).round(2)

puts "The are a of the room is #{square_meters} " + \
     "square meters (#{square_feet} square feet)."