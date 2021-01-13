# MY Solution
def title_case(title, minor_words = '')
  return '' if title == ''
  minor_words = minor_words.split.map(&:capitalize)
  capitalized_array = title.split.map(&:capitalize)
  
  first = capitalized_array[0]  
  capitalized_array[1..-1].map! { |word| minor_words.include?(word) ? word.downcase : word }.prepend(first).join(' ')
end

# Codewars
def title_case2(title, minor_words = '')
  title.capitalize.split().map{|a| minor_words.downcase.split().include?(a) ? a : a.capitalize}.join(' ')
end

def title_case3(title, minor_words='')
  minor_words = minor_words.downcase.split(' ')
  title.capitalize.split(' ').map { |word| minor_words.include?(word.downcase) ? word : word.capitalize }.join(' ')
end

p title_case3('the wind in the willows', 'the in')