# Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively.
# Both methods should return a value in the range 0..1439.

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def after_midnight(time_string)
  hours = time_string[0..1].to_i
  minutes = time_string[3..4].to_i
  total_minutes = minutes + (hours * 60)

  mins_after_midnight = total_minutes % MINUTES_PER_DAY
  mins_after_midnight
end


def before_midnight(time_string)
  mins_before_midnight = (1440 - after_midnight(time_string)) % 1440
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0


##################################################################

# Further Exploration
