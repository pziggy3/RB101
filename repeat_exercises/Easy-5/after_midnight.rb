# Initial solution - WRONG, last and 3rd to last are false
def time_of_day(minutes)
  if minutes < 0
    hours, remaining_minutes = minutes.abs.divmod(60)
    hours = (24 - hours) - 1
    remaining_minutes = 60 - remaining_minutes
  else
    hours, remaining_minutes = minutes.divmod(60)
  end
  
  format('%02d:%02d', hours, remaining_minutes)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

###############################################################3
# L.S. Solution

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day2(delta_minutes)
  delta_minutes = delta_minutes % MINUTES_PER_DAY   # need this for minutes > total minutes per day (>1 day) AND negative minutes
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

p time_of_day2(0) == "00:00"
p time_of_day2(-3) == "23:57"
p time_of_day2(35) == "00:35"
p time_of_day2(-1437) == "00:03"
p time_of_day2(3000) == "02:00"
p time_of_day2(800) == "13:20"
p time_of_day2(-4231) == "01:29"

# Each %02d produces a two-digit number with leading zeros as needed. 