# DEFINITELY REDO
# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds.

########################################################################

DEGREE_SYMBOL = "\xC2\xB0"   # constant to represent the DEGREE SYMBOL
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  remaining_minutes, remaining_seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)

  format(%(#{degrees}#{DEGREE_SYMBOL}%02d'%02d"), remaining_minutes, remaining_seconds)
end


p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")