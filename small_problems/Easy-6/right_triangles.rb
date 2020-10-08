def triangle(row_number)
  spaces = row_number - 1
  stars = 1

  row_number.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end

triangle(9)