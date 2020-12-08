"""
Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers:
addition, subtraction, product, quotient, remainder, and power.
Do not worry about validating the input.
"""

puts "Enter the 1st number:"
first_number = gets.chomp.to_i

puts "Enter the 2nd number:"
second_number = gets.chomp.to_i

puts "#{first_number} + #{second_number} = #{first_number + second_number}"
puts "#{first_number} - #{second_number} = #{first_number - second_number}"
puts "#{first_number} * #{second_number} = #{first_number * second_number}"
puts "#{first_number} / #{second_number} = #{first_number / second_number}"
puts "#{first_number} % #{second_number} = #{first_number % second_number}"
puts "#{first_number} ** #{second_number} = #{first_number ** second_number}"
