""" 
Write a program that solicits 6 numbers from the user, then
prints a message that describes whether or not the 6th number
appears amongst the first 5 numbers.
"""

number_list = []

puts "==> Enter the 1st number:"
number_list << gets.chomp.to_i
puts "==> Enter the 2nd number:"
number_list << gets.chomp.to_i
puts "==> Enter the 3rd number:"
number_list << gets.chomp.to_i
puts "==> Enter the 4th number:"
number_list << gets.chomp.to_i
puts "==> Enter the 5th number:"
number_list << gets.chomp.to_i
puts "==> Enter the 6th number:"
last_number = gets.chomp.to_i

if number_list.include? last_number
  puts "The number #{last_number} appears in #{number_list}"
else
  puts "The number #{last_number} does NOT appear in #{number_list}"
end



