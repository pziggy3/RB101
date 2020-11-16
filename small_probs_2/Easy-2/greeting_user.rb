puts "What is your name?"
name = gets.chomp

# should use "name[-1]" and "name.chop" to get rid of '!'
if name.include?('!')
  puts "Hello #{name}. WHY ARE WE SCREAMING?".delete('!').upcase
else
  puts "Hello #{name}."
end

# L.S. Solution
print 'What is your name? '
name = gets.chomp

if name[-1] == '!'
  name = name.chop
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end