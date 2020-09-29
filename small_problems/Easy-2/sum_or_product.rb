puts ">> Please enter integer greater than 0:"
integer = gets.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp.to_s

if operation == 's'
  sum = (1..integer).reduce(:+)
  puts "The sum of the integers between 1 and #{integer} is #{sum}."
elsif operation == 'p'
  product = (1..integer).reduce(:*) if operation == 'p'
  puts "The sum of the integers between 1 and #{integer} is #{product}."
else
  puts "Oops. Unknown operation."
end


# Launch School Solution (but I like mine more ;])
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

