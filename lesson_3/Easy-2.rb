# Question 1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.key?("Spot")
ages.include?("Spot")
ages.member?("Spot")


# Question 2
munsters_description = "The Munsters are creepy in a good way."
a = munsters_description.chars
a.map do |char|
  if char != char.upcase
    char.upcase!
  else
    char.downcase!
  end 
end

a.join

# Easy way
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.swapcase!
p munsters_description.capitalize!
p munsters_description.downcase!
p munsters_description.upcase!


# Question 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)

p ages


# Question 4
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.match?("Dino")
# # Note that this is not a perfect solution, as it would match any substring with Dino in it.


# Question 5
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones2 = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones2


# Question 6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones << "Dino"


# Question 7
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino").push("Hoppy")      # push returns the array so we can chain
# or...
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.concat(%w(Dino Hoppy))        # concat adds an array rather than one item


# Question 8
advice = "Few things in life are as important as house training your pet dinosaur."
new_advice = advice.slice!("Few things in life are as important as ")
# or...
advice = "Few things in life are as important as house training your pet dinosaur."
new_advice2 = advice.slice!(0, advice.index('house'))

p new_advice
p new_advice2
p advice


# Question 9
statement = "The Flintstones Rock!"
p statement.count('t')


# Question 10
title = "Flintstone Family Members"
p title.center(40)