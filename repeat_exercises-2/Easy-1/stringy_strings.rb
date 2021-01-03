def stringy(number)
  result = ''
  1.upto(number) do |num|
    result << "1" if num.odd?
    result << "0" if num.even?
  end
  result
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# Time: 2:19