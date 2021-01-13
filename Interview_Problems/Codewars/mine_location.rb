def mineLocation(field)
  field.each_with_index do |col_pass, col_index|
    col_pass.each_with_index do |row_pass, row_index| 
      return [col_index, row_index] if row_pass == 1
    end
  end
end

# Codewars Solution
def mineLocation(field)
  field.each_with_index { |x, i| return i, x.index(1) if x.include? 1}
end