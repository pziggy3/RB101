CURRENT_YEAR = 2016

puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

work_years = retirement_age - age
retirement_year = work_years + CURRENT_YEAR

puts "It's #{CURRENT_YEAR}. You will retire in #{retirement_year}."
puts "You only have #{work_years} years of work to go!"


