# Write a method that returns the number of Friday the 13ths in the year given by an argument.

require 'date'

def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.civil(year, 1, 13)  # starting on first month at the 13th day
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month  # `next_month` makes the date become (year, 2, 13), and so on...
  end
  unlucky_count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2