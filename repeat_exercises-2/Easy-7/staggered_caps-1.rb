def staggered_case(string)
  index = -1
  characters = string.chars.map do |char|
    index += 1
    if index.even?
      char.upcase
    else
      char.downcase
    end
  end
  characters.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

########################################################3

# LS Solution
def staggered_case2(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper    # useful construct
  end
  result
end