puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip_percentage = gets.chomp.to_f / 100

tip = (bill * tip_percentage).round(1)
total = (bill + tip).round(1)

puts "The tip is #{tip}"
puts "The total is #{total}"