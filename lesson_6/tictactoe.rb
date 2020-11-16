require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +   # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +   # cols
                [[1, 5, 9], [3, 5, 7]]                # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'cls'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  # creating a board hash, with its keys correlating to the space number
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  # returns an array - the key numbers on the board that are empty
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

# Launch School Solution
def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    # change the last element of the array
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

# this method will modify the local variable "board"
# because it mutates the variable (the hash),
# it will be available outside the method

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil

  # 1. offense first
  # finds a line that has two COMPUTER markers, so that it can fill in the 3rd
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, COMPUTER_MARKER)
      break if square
    end
  end

  # 2. then defense
  WINNING_LINES.each do |line|
    # 8 lines in WINNING_LINES, so iterates 8 times
    # "square" is the number of the space in a line where it's empty but the other two are X's
    # the find_at_risk_square returns nil if the square isn't at risk, or else "square" is a number and we break out of the iteration
    square = find_at_risk_square(line, brd, PLAYER_MARKER)
    break if square
  end

  # 3. if "square" is nil after offense and defense...i.e there's no at risk square to defend and there's no square to offend...then computer randomly picks a square
  if !square
    square = empty_squares(brd).sample
  end

  # After one of the 3 above paths, the computer fills in the marker
  brd[square] = COMPUTER_MARKER
end

def find_at_risk_square(line, board, marker)
  # "line" is an array of 3 spaces (e.g. [1, 2, 3])
  # "board" is the board hash
  if board.values_at(*line).count(marker) == 2
    # condition only runs iif there are 2 X's on the line
    # board.select { |k, v| line.include?(k) } => gets the items from the board hash that match the keys => {1=>"X", 2=>"X", 3=>" "}
    # && v == ' ' => gets the item from the hash which matches the key (either 1, 2, 3) and the value is " " => {3=>" "}
    # .keys gets an array of the keys that match the selection => [3]
    # .first returns the value => 3
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end


def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  # bang-bang (!!) forcibly turns value into a Boolean
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    # 8 lines in WINNING_LINES, so iterates 8 times
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      # Splat Operator - equivalent to below
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil # nobody won yet
end

loop do
  # variable keeps track of the state of our game
  # we're going to pass around this variable
  board = initialize_board

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  # shows the last squares that were marked?
  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Goodbye!"
