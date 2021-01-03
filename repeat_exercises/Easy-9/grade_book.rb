# Write a method that determines the mean (average) of the three scores passed to it,
# ...and returns the letter value associated with that grade.
# Tested values are all between 0 and 100.
# There is no need to check for negative values or values greater than 100.

########################################################################

def get_grade(score_1, score_2, score_3)
  average = (score_1 + score_2 + score_3) / 3

  case average
  when 0..59 then  'F'
  when 60..69 then 'D'
  when 70..79 then 'C'
  when 80..89 then 'B'
  else             'A'
  end
end
# the comparison used by the case statement returns true if the range includes the other object (essentially calling (range).include?(other_object).
# You can therefore read it as:
# when (90..100).include?(average)


p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

########################################################################

# Further exploration - How would you handle this if there was a possibility of extra credit grades causing it to exceed 100 points?
# Answer: My solution makes that possible
