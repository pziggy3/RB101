### Pseudocode
# 1. Initialize deck
# 2. Deal 2 cards to player and dealer
# 3. Player turn: hit or stay
  # - repeat until bust or stay
# 4. If player bust, dealer wins
# 5. Dealer turn: hit or stay
  # - repeat until total >= 17
# 6. If dealer bust, player wins
# 7. Compare cards and declare winner

# My first attempt at a deck
deck = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
         '8' => 8, '9' => 9, '10' => 10, 'jack' => 10, 'queen' => 10,
         'king' => 10, 'ace' => [1, 11] }

# Instead...use a nested array, where each array element is itself a 2-element array that represents
# a card (its suit and value).
# a hand that contains 2 of Hearts, Jack of Spades, and Ace Diamonds
cards = [['H', '2'], ['S', 'J'], ['D', 'A']]


# 2. Calculating Aces 
def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  # adding each card value to sum
  sum = 0
  values.each do |value|
    if value == "a"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  # the 'times' function in ruby returns all the numbers from 0 to one less than the number itself, it iterates the given block
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?
  total(cards) >= 21
end

# 3. Player turn
answer = nil
loop do
  puts "hit or stay?"
  answer = gets.chomp
  break if answer == 'stay' || busted?
end

if busted?
  # end the game or ask the user to play again?
else
  puts "You chose to stay!"  # if player didn't bust, must have stayed to get here
end


# 4. Dealer turn
answer = nil
loop do
  # break if player busts || total >= 17
  puts "hit or stay?"
  answer = gets.chomp
end



# 5. Display results


end