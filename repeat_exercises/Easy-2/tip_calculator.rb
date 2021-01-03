# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate.
# The program must compute the tip and then display both the tip and the total amount of the bill. 

print "What is the bill? "
bill = gets.to_f

print "What is the tip percentage? "
tip_percentage = gets.to_f / 100

tip = (bill * tip_percentage).round(1)
puts "The tip is $#{tip}"
puts "The total is $#{(bill + tip).round(1)}"