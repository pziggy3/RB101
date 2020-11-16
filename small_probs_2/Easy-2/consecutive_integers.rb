puts "Please enter an integer greater than 0:"
integer = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."

operation = ''
result = 0
numbers = 1.upto(integer).to_a

loop do
  operation = gets.chomp
  case operation
  when 's'
    operation = 'sum'
    result = numbers.inject(:+)
    break
  when 'p'
    operation = 'product'
    result = numbers.inject(:*)
    break
  else
    puts "\nOops. Unknown operation..."
    puts "Enter 's' to compute the sum, 'p' to compute the product."
  end
end

puts "The #{operation} of the integers between 1 and #{integer} is #{result}."


###################################################
# L.S. Solution 

def compute_sum(number)
  total = 0
  1.upto(number) { |value| total += value }
  total
end

def compute_product(number)
  total = 1
  1.upto(number) { |value| total *= value }
  total
end

puts ">> Please enter an integer greater than 0"
number = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

if operation == 's'
  sum = compute_sum(number)
  puts "The sum of the integers between 1 and #{number} is #{sum}."
elsif operation == 'p'
  product = compute_product(number)
  puts "The product of the integers between 1 and #{number} is #{product}."
else
  puts "Oops. Unknown operation."
end