# Write a program that asks the user to enter an integer greater than 0,
# then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

print "Enter an integer greater than 0: "
integer = gets.to_i


loop do 
  print "Do you want the sum or product of all numbers between 1 and #{integer}?"
  answer = gets.chomp
  
  case answer
  when "sum"
    sum = (1..integer).to_a.reduce(:+)
    puts "The sum is #{sum}"
    break
  when "product"
    product = (1..integer).to_a.reduce(:*)
    puts "The product is #{product}"
    break
  else
    puts "Try again..."
  end
end