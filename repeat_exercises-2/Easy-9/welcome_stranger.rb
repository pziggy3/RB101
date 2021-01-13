def greetings(array, hash)
  name = array.join(' ')
  title = hash[:title]
  occupation = hash[:occupation]
  puts "Hello, #{name}! Nice to have a #{title} #{occupation}!"
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

# 3:11