def triangle(angle_1, angle_2, angle_3)
  angles = [angle_1, angle_2, angle_3]

  case
  when angles.reduce(:+) != 180, angles.include?(0)   # you can use a comma instead of an OR operator
    :invalid
  when angles.include?(90)
    :right
  when angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid