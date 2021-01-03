# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid 
# depending on whether the triangle is equilateral, isosceles, scalene, or invalid.
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0

def triangle(side_1, side_2, side_3)
  sides = [side_1, side_2, side_3]
  longest_side = sides.max

  case
  when 2 * longest_side > sides.reduce(:+), sides.include?(0)   # || sides.include?(0)
    :invalid
  when side_1 == side_2 && side_2 == side_3
    :equilateral
  when side_1 == side_2 || side_2 == side_3 || side_1 == side_3
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid