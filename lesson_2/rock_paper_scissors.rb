VALID_CHOICES = %w(rock paper scissors spock lizard)
winning_moves = {
  rock: ["scissors", "lizard"],
  paper: ["rock", "spock"],
  scissors: ["paper", "lizard"],
  spock: ["scissors", "rock"],
  lizard: ["paper", "spock"]
}

def win?(first, second, hash)
  hash[first.to_sym].include?(second)
end

def display_result(player, computer, hash)
  if win?(player, computer, hash)
    prompt("You won!")
  elsif win?(computer, player, hash)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def prompt(message)
  puts "=> #{message}"
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    # need to validate user's input
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose: #{choice}; Computer chose: #{computer_choice}"

  # encapsulate a piece of logic in a method - makes it easier to read
  display_result(choice, computer_choice, winning_moves)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
