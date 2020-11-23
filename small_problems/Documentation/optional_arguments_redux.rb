require 'date'

puts Date.civil
# -4712-01-01  --  # everything defaults

puts Date.civil(2016)
# 2016-01-01  --   # month, mday, start use defaults

puts Date.civil(2016, 5)
# 2016-05-01  --  # mday, start uses default

puts Date.civil(2016, 5, 13)
# 2016-05-13  --  # start uses default

puts Date.civil(1751, 5, 13, Date::ENGLAND) # nothing defaults
