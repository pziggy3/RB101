# 1) Turn this array into a hash where the names are the keys and the values are the positions in the array.
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# My Solution
flintstones_hash = flintstones.each_with_object({}) do |value, hash|
  hash[value] = flintstones.find_index(value)
end
p flintstones_hash

# L.S Solution 
flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end

#################################################################################################################

# 2) Add up all of the ages from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# My Solution 1 - each
total_age = 0
ages.each { |key, value| total_age += value }
p total_age

# My Solution 2 - reduce/inject
# (To safely get 0 when the hash is empty, use:)
p ages.values.reduce(0) { |sum, age| sum + age }
p ages.reduce(0) { |sum, (key, value)| sum + value }
p ages.values.inject(:+)

# L.S. solution
total_ages = 0
ages.each { |_, age| total_ages += age }
total_ages

# This uses ages.values to make an array, then uses the inject method which is part of the Enumerable module.


#################################################################################################################


# 3) remove people with age 100 and greater.
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# My Solution
p ages.reject! { |_, age| age >= 100 }

# L.S. Solution
ages.keep_if { |_, age| age < 100 }
# equivalent to Hash#select!


#################################################################################################################


# 4) Pick out the minimum age from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.min


#################################################################################################################


# 5) Find the index of the first name that starts with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.index { |name| name[0, 2] == "Be" }  


#################################################################################################################


# 6) Amend this array so that the names are all shortened to just the first three characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.map! { |name| name[0, 3] }


#################################################################################################################


# 7) Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"

letter_hash = statement.chars.each_with_object({}) do |letter, hash|
  hash[letter] = statement.count(letter)
end

p letter_hash
# ex:
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

# L.S. Solution
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end


#################################################################################################################


# 8) What happens when we modify an array while we are iterating over it? What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end


#################################################################################################################


# 9) As we have seen previously we can use some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...titleize. This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:
words = "the flintstones rock"
# would be:
words = "The Flintstones Rock"
# Write your own version of the rails titleize implementation.


#################################################################################################################



# 10) Given the munsters hash below
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

  # Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.