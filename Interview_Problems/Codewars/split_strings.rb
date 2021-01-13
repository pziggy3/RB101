def solution(str)
  substr = ''
  array = []
  str.each_char do |char|
    if substr.length < 2 
      substr += char
    else
      array << substr
      substr = '' << char
    end
    array << substr
  end
  array.select { |a| a.size == 2 }.uniq
end