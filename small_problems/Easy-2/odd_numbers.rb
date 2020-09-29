(1..99).each do
  |num| puts num if num.odd?
end

puts "\n"

(1..99).to_a.select { |n| puts n if n.odd? }

puts "\n"

puts (1..99).to_a.select(&:odd?)