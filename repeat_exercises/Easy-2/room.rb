# Build a program that asks a user for the length and width of a room in meters
# and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

########################################################################

SQ_METER_TO_SQ_FEET = 10.7639 

puts "Length of room (in square meters)?"
meter_length = gets.to_f

puts "Width of room (in square meters)?"
meter_width = gets.to_f

square_meters = (meter_length * meter_width).round(2)
square_feet = (square_meters * SQ_METER_TO_SQ_FEET).round(2)

puts "The area of the room is #{square_meters} " + \
     "square meters (#{square_feet} square feet)."

