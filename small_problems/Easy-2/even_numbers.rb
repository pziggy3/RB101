puts (1..99).to_a.select(&:even?)

# Launch School solution
value = 1
while value <= 99
  puts value if value.even?
  value += 1
end