def reverse_words(string)
  reversed_array = string.split.map do |word|
    if word.size >= 5
      word.reverse
    else
      word
    end
  end
  reversed_array.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

# Time: 3:20