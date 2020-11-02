def letter_percentages(string)
  # My initial solution - 2nd test is wrong because of decimals
  hash = {}
  lc = ('a'..'z').to_a
  uc = ('A'..'Z').to_a

  lc_count = string.chars.count { |char| lc.include? char }
  uc_count = string.chars.count { |char| uc.include? char }
  total_count = string.length
  neither_count = total_count - lc_count - uc_count

  lc_percentage = ((lc_count.to_f / total_count.to_f) * 100).to_i
  uc_percentage = ((uc_count.to_f / total_count.to_f) * 100).to_i
  neither_percentage = ((neither_count.to_f / total_count.to_f) * 100).to_i

  hash[:lowercase] = lc_percentage
  hash[:uppercase] = uc_percentage
  hash[:neither] = neither_percentage

  hash
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }


# L.S. Solution
def letter_percentages(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = { lowercase: [], uppercase: [], neither: [] }
  characters = string.chars
  length = string.length

  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }