require 'date'

def friday_13th(year)
  unlucky_count = 0 
  thirteenth = Date.new(year, 1, 13)        # starting on first month at the 13th day
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month      # this method makes the date become (year, 2, 13), and etc
  end
  unlucky_count
end

# civil OR new- creates a date object denoting the given calender date
# year, month, mday

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
