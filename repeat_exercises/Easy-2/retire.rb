# Build a program that displays when the user will retire and how many years she has to work till retirement.
CURRENT_YEAR = 2020
print "What is your age? "
age = gets.to_i

print "At what age would you like to retire? "
retirement_age = gets.to_i

years_of_work = retirement_age - age
retirement_year = CURRENT_YEAR + years_of_work

puts "It's #{CURRENT_YEAR}. You will retire in #{retirement_year}"
puts "You only have #{years_of_work} years of work to go!"
