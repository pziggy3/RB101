puts "Please write word or multiple words:"
input = gets.chomp

spaces = 0
input.split("").each do |char|
  spaces += 1 if char == ' '
end

number_of_chars = input.length - spaces

puts "There are #{number_of_chars} characters in \"#{input}\"."


# Launch School Solution -- MUCH EASIER

print 'Please write word or multiple words: '
input = gets.chomp
number_of_chararacters = input.delete(' ').size   
puts "There are #{number_of_chararacters} character in \"#{input}\"."

# Note: 'size' is an alias to the 'length' method