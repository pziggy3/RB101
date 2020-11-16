SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

# @variables are called instance variables in ruby. Which means you can access these variables in ANY METHOD inside the class
###### Change this to lowercase because it's not a constant
@PLAYER_COUNT = 0
@DEALER_COUNT = 0

WINNING_SCORE = 21
DEALER_SCORE = 17
ROUNDS_TO_WIN = 5

################################################

# Methods
def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  """CREATES A NESTED ARRAY DECK"""

  # cards = [['H', '3'], ['S', 'Q'], ... ]
  SUITS.product(VALUES).shuffle
end

def total(cards)
  """CALCULATES THE TOTAL OF THE CARDS IN A HAND. RETURNS INTEGER."""

  # cards = [['H', '3'], ['S', 'Q'], ... ]
  # creates ARRAY OF VALUES from deck by iterating over each array (each card) in deck, and selecting its value
  values = cards.map { |card| card[1] }

  # iterates over each card value in "values" and adds it to "sum"
  sum = 0
  values.each do |value|
    if value == "A"
      # Ace is initially worth 11, but will be corrected later
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      # "character.to_i" == 0
      # Jacks, Queens, and Kings are worth 10
      sum += 10
    else
      # the rest of the cards are worth their literal value ('7' => 7)
      sum += value.to_i
    end
  end

  # correct for Aces (if the hand is greater than 21)
  # e.g. ["A", "A", "A"].select { |value| value == "A"}.count.times == 3.times do
  values.select { |value| value == "A"}.count.times do
    sum -= 10 if sum > WINNING_SCORE
  end

  # method returns the sum value (total of a hand), an integer
  sum
end

def busted?(hand_total)
  """DETERMINES IF A HAND BUSTS OR NOT. RETURNS BOOLEAN."""
  hand_total > WINNING_SCORE
end

def detect_result(player_total, dealer_total)
  """DETERMINES WINNER OF DEALER AND PLAYER HANDS. RETURNS SYMBOL."""

  # # initialize player and dealer count
  # player_count = 0
  # dealer_count = 0

  # Compares totals of player and dealer cards to determine winner. Symbol of result is returned.
  if player_total > WINNING_SCORE
    @DEALER_COUNT += 1
    :player_busted
  elsif dealer_total > WINNING_SCORE
    @PLAYER_COUNT += 1
    :dealer_busted
  elsif dealer_total < player_total
    @PLAYER_COUNT += 1
    :player
  elsif dealer_total > player_total
    @DEALER_COUNT += 1
    :dealer
  else
    # puts "Player wins: #{@PLAYER_COUNT}"
    # puts "Dealer wins: #{@DEALER_COUNT}"
    :tie
  end
end

def display_result(player_total, dealer_total)
  """OUTPUTS THE WINNER TO USER BY USING 'detect_result' TO COMPARE HANDS. RETURNS NIL."""

  # result is a symbol (:player_busted, :dealer_busted, :player, :dealer, :tie)
  result = detect_result(player_total, dealer_total)

  prompt "Player wins: #{@PLAYER_COUNT}"
  prompt "Dealer wins: #{@DEALER_COUNT}"

  # outputs the winner (or tie) based on the return value of result (a symbol)
  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def play_again?
  """ASKS THE USER TO PLAY AGAIN OR NOT. RETURNS BOOLEAN (T/F)"""
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')  # start_with? returns boolean (T/F)
end

def round_end(player_cards, dealer_cards, player_total, dealer_total)
  """CONSISTENT END-OF-ROUND OUTPUT"""
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of #{dealer_total}"
  prompt "Player has #{player_cards}, for a total of #{player_total}"
  display_result(player_total, dealer_total)
  puts "=============="
end

def overall_winner?
  if @PLAYER_COUNT == ROUNDS_TO_WIN
    prompt "Player is the overall winner!"
    @PLAYER_COUNT
  elsif @DEALER_COUNT == ROUNDS_TO_WIN
    prompt "Dealer is the overall winner!"
    @DEALER_COUNT
  else
    nil
  end
end

################################################

# MAIN GAME LOOP
loop do
  prompt "Welcome to Twenty-One!"

  # initialize variables - deck is the nested array of cards, player+dealer cards arrays
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # Initial deal - Add 2 cards to player + dealer hands
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  # CACHING each player's total in a local variable - PERFORMANCE IMPROVEMENT
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  # Tells the player the FIRST card of the dealer's hand, but keeps the second one hidden.
  # Tells the player both cards of his own hand, as well as the total value of his own hand.
  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have #{player_cards[0]} and #{player_cards[1]}, for a total of #{player_total}."

  # player turn
  loop do
    # This outer loop representst the player's turn - the player turn ends (breaks out of the loop) if he STAYS or he BUSTS
    player_turn = nil
    loop do
      # This inner loop ensures that the player's action is either to hit or stay, if not, then the player is asked again.
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      # breaks out of loop if the player decides to hit or stay.
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    # The player hits (takes a card from the deck)
    # All of the player_cards (his hand, an array) and the hand's total are outputed.
    if player_turn == 'h'
      player_cards << deck.pop
      player_total = total(player_cards)  # have to update player_total to reflect addition of new card
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{player_total}"
    end

    # the player turn ends (breaks out of outer loop) if he STAYS or he BUSTS
    break if player_turn == 's'  || busted?(player_total)
  end

  # Winner is displayed if player's hand busts, (dealer automatically wins), and player is asked to play again.
  if busted?(player_total)
    # PLayer+Dealer hands are compared and winner is determined + displayed
    # Breaks out of loop unless there's an overall winner OR player wants to play again
    round_end(player_cards, dealer_cards, player_total, dealer_total)
    next if !overall_winner? && play_again?
    break
    
  # If player stays AND his hand doesn't bust, his hand's total is outputed. Dealer's turn is next.
  else
    prompt "You stayed at #{player_total}"
  end

  # Dealer Turn
  prompt "Dealer turn..."

  loop do
    # Automatically breaks out of this inner loop if dealer's hand >= 17, then: either dealer's hand BUSTS OR the player+dealer's hands are COMPAREDS. 
    break if dealer_total >= DEALER_SCORE

    # If dealer's hand is less than 17, then he automatically hits (gets a card from deck).
    # THIS KEEPS GOING until dealer's hand is >= 17.
    prompt "Dealer hits!"
    dealer_cards << deck.pop
    dealer_total = total(dealer_cards)  # have to update dealer_total to reflect addition of new card
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  if busted?(dealer_total)
    # Only runs if dealer's hand is >= 17. If dealer's hand busts, then the two hands are compared (player automatically wins, though). User is asked whether to play again.
    # PLayer+Dealer hands are compared and winner is determined + displayed
    # Breaks out of loop unless there's an overall winner OR player wants to play again
    round_end(player_cards, dealer_cards, player_total, dealer_total)
    next if !overall_winner? && play_again?
    break

  else
    # Runs if dealer's hand is less than 17.
    prompt "Dealer stays at #{dealer_total}"
  end

  # both player and dealer stay - neither hand busts - COMPARE CARDS!
  # PLayer+Dealer hands are compared and winner is determined + displayed
  # Breaks out of loop unless there's an overall winner OR player wants to play again
  round_end(player_cards, dealer_cards, player_total, dealer_total)
  next if !overall_winner? && play_again?
  break

end

prompt "Thank you for playing Twenty-One! Good bye!"