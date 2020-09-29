puts 'What is the bill?'
bill = gets.to_f

puts 'What is the tip percentage?'
tip_percentage = gets.to_f

tip_amount = ((tip_percentage / 100) * bill).round(2)
total = (bill + tip_amount).round(2)

puts "The tip is $#{'%.2f' % tip_amount}."
puts "the total is $#{'%.2f' % total}."