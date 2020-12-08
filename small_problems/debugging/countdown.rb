def decrease(counter)
  counter - 1
end

counter = 10

10.times do
  puts counter
  counter = decrease(counter)
  # we can reassign the variable counter on line 9 to the return value of decrease(counter) each time we iterate through the block
end

puts 'LAUNCH!'