def get_grade(grade_1, grade_2, grade_3)
  grades = [grade_1, grade_2, grade_3]
  average = grades.inject(:+) / grades.size

  case average
  when 90..100 then 'A'
  when 80..89 then 'B'
  when 70..79 then 'C'
  when 60..69 then 'D'
  else 'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

# the comparison used by the case statement returns true if the range includes the other object (essentially calling (range).include?(other_object).
# you can read it as `when (90..100).include?(result)`
