def greetings(name, status)
  "Hello, #{name.join(' ')}! Nice to have a #{status[:title]} #{status[:occupation]} around!"
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })