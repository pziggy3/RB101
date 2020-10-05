def ascii_value(string)
  if !string.empty?
    ascii_values = string.chars.map { |char| char.ord }
    ascii_values.reduce(:+)
  else
    0
  end
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0


# Launch School solution
def ascii_value2(string)
  sum = 0
  string.each_char { |char| sum += char.ord }
  sum
end

