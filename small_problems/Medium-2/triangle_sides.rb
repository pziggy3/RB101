def triangle(side_1, side_2, side_3)
  sides = [side_1, side_2, side_3]
  largest_side = sides.max

  case
  when largest_side > (sides.reduce(:+) - largest_side) || sides.include?(0)
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