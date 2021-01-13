MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE
DEGREE = "\xC2\xB0"

def dms(degrees)
  total_seconds = degrees * SECONDS_PER_DEGREE
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, remaining_seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, remaining_seconds)
end
# We use %() to delimit the string because we use both single and double quotes

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(76.73)
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")