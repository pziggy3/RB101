puts 'What is your name?'
name = gets.chomp

if name[-1] == '!'    # checks the last character of the string
  name = name.chop    # returns a new string with last char removed
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end