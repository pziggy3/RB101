def after_midnight(time_string)
  hours = time_string[0, 2].to_i
  minutes = time_string[-2, 2].to_i
  minutes = minutes + (hours * 60)
  hours, minutes = minutes.divmod(1440)
  minutes
end

def before_midnight(time_string)
  mins_before_midnight = 1440 - after_midnight(time_string)
  days, minutes = mins_before_midnight.divmod(1440)
  minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

# 11:26

####################################################3

# LS Solution
HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight2(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_string)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end