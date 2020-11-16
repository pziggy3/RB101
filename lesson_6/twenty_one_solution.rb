SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

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
    sum -= 10 if sum > 21
  end

  # method returns the sum value (total of a hand), an integer
  sum
end

def busted?(cards)
  """DETERMINES IF A HAND BUSTS OR NOT. RETURNS BOOLEAN."""
  total(cards) > 21
end

def detect_result(dealer_cards, player_cards)
  """DETERMINES WINNER OF DEALER AND PLAYER HANDS. RETURNS SYMBOL."""

  # Calculate totals of player and dealer cards.
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  # Compares totals of player and dealer cards to determine winner. Symbol of result is returned.
  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  """OUTPUTS THE WINNER TO USER BY USING 'detect_result' TO COMPARE HANDS. RETURNS NIL."""

  # result is a symbol (:player_busted, :dealer_busted, :player, :dealer, :tie)
  result = detect_result(dealer_cards, player_cards)

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
  puts "------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')  # start_with? returns boolean (T/F)
end

################################################

# Main Game Loop
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

  # Tells the player the FIRST card of the dealer's hand, but keeps the second one hidden.
  # Tells the player both cards of his own hand, as well as the total value of his own hand.
  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have #{player_cards[0]} and #{player_cards[1]}, for a total of #{total(player_cards)}."

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
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{total(player_cards)}"
    end

    # the player turn ends (breaks out of outer loop) if he STAYS or he BUSTS
    break if player_turn == 's'  || busted?(player_cards)
  end

  # Winner is displayed if player's hand busts, (dealer automatically wins), and player is asked to play again.
  if busted?(player_cards)
    display_result(dealer_cards, player_cards)
    # If player decides to play again, main game loop starts again (next), else break out of main game loop.
    play_again? ? next : break
  # If player stays AND his hand doesn't bust, his hand's total is outputed. Dealer's turn is next.
  else
    prompt "You stayed at #{total(player_cards)}"
  end

  # Dealer Turn
  prompt "Dealer turn..."

  loop do
    # Automatically breaks out of this inner loop if dealer's hand >= 17, then: either dealer's hand BUSTS OR the player+dealer's hands are COMPAREDS. 
    break if total(dealer_cards) >= 17

    # If dealer's hand is less than 17, then he automatically hits (gets a card from deck).
    # THIS KEEPS GOING until dealer's hand is >= 17.
    prompt "Dealer hits!"
    dealer_cards << deck.pop
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  if busted?(dealer_cards)
    # Only runs if dealer's hand is >= 17. If dealer's hand busts, then the two hands are compared (player automatically wins, though). User is asked whether to play again.
    prompt "Dealer total is now #{total(dealer_cards)}"
    display_result(dealer_cards, player_cards)
    play_again? ? next : break
  else
    # Runs if dealer's hand is less than 17.
    prompt "Dealer stays at #{total(dealer_cards)}"
  end

  # both player and dealer stay - neither hand busts - COMPARE CARDS!
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of #{total(player_cards)}"
  puts "=============="

  # PLayer+Dealer hands are compared and winner is determined + displayed.
  display_result(dealer_cards, player_cards)

  # Main game loop breaks unless player decides to play again (play_again == True)
  break unless play_again?
end

prompt "Thank you for playing Twenty-One! Good bye!"