def staggered_case(string)
  index = 0
  characters = string.chars.each do |char|
    index.even? ? char.upcase! : char.downcase!
    index += 1
  end
  characters.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

"""
NOTE:
Don't mutate a collection while iterating through it.
You can, however, mutate the individual elements within that collection, just not the collection itself. Otherwise, you'll get unexpected behavior.
"""

# Launch School Solution 
def staggered_case2(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    # Toggles need_upper to false every other iteration
    need_upper = !need_upper
  end
  result
end

p staggered_case2('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case2('ALL_CAPS') == 'AlL_CaPs'
p staggered_case2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'