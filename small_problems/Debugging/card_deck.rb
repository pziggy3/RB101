require 'pry'

# cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

# deck = { :hearts   => cards,
#          :diamonds => cards,
#          :clubs    => cards,
#          :spades   => cards }

# def score(card)
#   case card
#   when :ace   then 11
#   when :king  then 10
#   when :queen then 10
#   when :jack  then 10
#   else card
#   end
# end

# Pick one random card per suit

# player_cards = []
# deck.keys.each do |suit|
#   cards = deck[suit]
#   cards.shuffle!
#   player_cards << cards.pop
# end

# Determine the score of the remaining cards in the deck

# sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  ####### `map` returns a new array with the scores, but that array is never used - instead, the orignial `remaining_cards` is used
  # remaining_cards.map do |card|
    # score(card)
  # end

  ###### `remaining_cards` STILL references the original array (values of the deck hash) containing both integers representing numbered cards, and symbols representing face cards
  # sum += remaining_cards.sum
# end

# puts sum



##########################################################################33
# L.S. SOLUTION

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.clone,
         :diamonds => cards.clone,
         :clubs    => cards.clone,
         :spades   => cards.clone }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

# Using pry before we collect the player's card
# binding.pry

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop

  # Using pry at the end of each iteration
  # PROBLEM: by calling `deck` we see that shuffle! and pop happened to EVERY ARRAY (every suit), as oppossed to JUST ONE. (all suits are shuffled and missing the card the player picked)
  # REASON: in creating the deck, we assigned the SAME ARRAY OBJECT to each suit...the value associated with each key in our deck is the same object. So, each value in our deck hash is affected by that mutation
  # SOLUTION: clone the cards array when adding it to the deck. This will make each suit have its OWN cards object.
  # binding.pry
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  scores = remaining_cards.map do |card|
    score(card)
  end

  sum += scores.sum
end

puts sum


# In order to check the final sum, let's add a test case: The sum of the remaining cards in the deck should be the total sum of the deck when it's complete minus the sum of player_cards
total_sum  = 4 * [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11].sum
player_sum = player_cards.map { |card| score(card) }.sum

puts(sum == total_sum - player_sum)

# It's false...why?????
# PROBLEM: by calling `deck` we see that shuffle! and pop happened to EVERY ARRAY (every suit), as oppossed to JUST ONE. (all suits are shuffled and missing the card the player picked)
# REASON: in creating the deck, we assigned the SAME ARRAY OBJECT to each suit...the value associated with each key in our deck is the same object. So, each value in our deck hash is affected by that mutation
# SOLUTION: clone the cards array when adding it to the deck. This will make each suit have its OWN cards object.