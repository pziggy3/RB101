# Modify the method from the previous exercise so it ignores non-alphabetic
# characters when determining whether it should uppercase or lowercase each letter.
# The non-alphabetic characters should still be included in the return value; they
# just don't count when toggling the desired case.

########################################################################

# L.S. Solution
def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if char =~ /[a-z]/i
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    else
      result += char
    end
  end
  result
end
# the only difference is that we need to avoid changing need_upper when processing non-alphabetic characters

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

########################################################################
# NEED TO FINISH!

# Further Exploration - Modify this method so the caller can determine whether non-alphabetic characters should be counted when determining the upper/lowercase state.
# That is, you want a method that can perform the same actions that this method does, or operates like the previous version.
# hint: use a keyword argument

def staggered_case2(string, count_non_alpha)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if !count_non_alpha
      if char =~ /[a-z]/i
        if need_upper
          result += char.upcase
        else
          result += char.downcase
        end
        need_upper = !need_upper
      else
        result += char
      end
    else
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    end
    result
  end
end

p staggered_case2('I Love Launch School!', true) 
p staggered_case2('I Love Launch School!', false) 
