# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

user_numbers = []

puts "==> Enter the 1st number:"
user_numbers << gets.chomp.to_i
puts "==> Enter the 2nd number:"
user_numbers << gets.chomp.to_i
puts "==> Enter the 3rd number:"
user_numbers << gets.chomp.to_i
puts "==> Enter the 4th number:"
user_numbers << gets.chomp.to_i
puts "==> Enter the 5th number:"
user_numbers << gets.chomp.to_i
puts "==> Enter the 6th number:"
number_6 = gets.chomp.to_i

if user_numbers.include? number_6
  puts "The number #{number_6} appears in #{user_numbers}"
else
  puts "The number #{number_6} does NOT appear in #{user_numbers}"
end
