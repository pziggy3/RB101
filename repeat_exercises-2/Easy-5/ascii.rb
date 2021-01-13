def ascii_value(string)
  ord_array = string.chars.map { |char| char.ord }
  ord_array.reduce(0, :+)
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# 2:59