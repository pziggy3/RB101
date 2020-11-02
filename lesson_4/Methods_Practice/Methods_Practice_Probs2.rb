# 1. Turn this array into a hash where the names are the keys and the values are the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
counter = 0

flintstones.each_with_object({}) do |value, hash|
  hash[value] = counter
  counter += 1
end

# L.S. Solution
flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end


# 2. Add up all of the ages from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
total = 0
ages.each_value { |num| total += num }
p total

# L.S. Solution
# loops through whole hash, not just hash values
total_ages = 0
ages.each { |_, value| total_ages += value }
p total_ages

# Other Solution
p ages.values.inject(:+)
# "apply the + operator to the accumulator and object parameters of inject".



# 3. Remove people with age 100 and greater 
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.select! do |key, value|
  value < 100
end
# makes sure to use '!' to make the method destructive

# L.S. Solution
ages.keep_if { |_, age| age < 100 }
# Automatically destructive - equivalent to select!



# 4. Pick out the minimum age from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.values.min



# 5. Find the index of the first name that starts with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.each_with_index do |name, index|
  if name.start_with?("Be")
    puts index
  end
end
# DOESNT WORK - RETURNS ORIGINAL ARRAY because it's an each method

# L.S solution - BETTER
flintstones.index { |name| name[0, 2] == "Be" }


# 6. Amend this array so that the names are all shortened to just the first three characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! do |name|
  name = name[0, 3]
end
flintstones
# Or: flintstones.map! { |name| name[0, 3]}
# 0,3 (not 0, 2) because last index isn't included
# Be sure to include '!' to mutate the original array



# 7. Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end
result
# scan puts all occurences of the argument into an array (e.g. 'bbbb'.scan == ["b", "b", "b", "b"])
# ".count" counts the elements in the array
# In this case, a separate array is create for every 'letter' in 'letters' 



# 8. What happens when we modify an array while we are iterating over it? What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|      # |number| is initially 1 and then moves to 3 (the next index position), because 1 was removed
  p number
  numbers.shift(1)
end
# prints 1 3 ..... returns [3, 4]

numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.pop(1)
end
# prints 1 2 
# returns [1, 2]
# We're shortening the array each pass just as in the first example...but the items removed are beyond the point we are sampling from in the abbreviated loop.



# 9. Write your own version of the rails titleize implementation.
def titleize(string)
  words.split.map { |word| word.capitalize }.join(' ')
end



# 10. Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior).

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  case details["age"]
  when 0..18                      # range doesnt count the last number
    details["age_group"] = "kid"
  when 18..65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

# QUESTION: what's the difference between ranges with 2 dots and 3 dots?