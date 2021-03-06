require 'pry'

TURN = 'choose'.freeze
PLAYER_MARKER = 'X'.freeze
INITIAL_MARKER = ' '.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
player = 0
computer = 0

def prompt(message)
  puts "=> #{message}"
end

def joinor(arr, delimiter=', ', word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
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

def empty_square(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
    nil
  end
end

def place_piece!(brd, current_player)
  case current_player
  when 'computer'
    square = nil
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, COMPUTER_MARKER)
      break if square
    end

    if !square
      WINNING_LINES.each do |line|
        square = find_at_risk_square(line, brd, PLAYER_MARKER)
        break if square
      end
    end

    if !square
      square = 5 if brd[5] == INITIAL_MARKER
    end

    if !square
      square = empty_square(brd).sample
    end

    brd[square] = COMPUTER_MARKER

  when 'player'
    square = ''
    loop do
      prompt "Choose a square #{joinor(empty_square(brd))}:"
      square = gets.chomp.to_i
      break if empty_square(brd).include?(square)
      prompt("Sorry not a valid choice.")
    end
    brd[square] = PLAYER_MARKER
  end
end

def board_full?(brd)
  empty_square(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def show_score(score)
  prompt("(#{score}/5)")
end

def alternate_player(current_player)
  if current_player == "computer"
    current_player.replace("player")
  elsif current_player == "player"
    current_player.replace("computer")
  end
end

loop do # main loop
  loop do # 5 games loop
    board = initialize_board
    turn = TURN
    if turn == 'choose'
      loop do
        prompt("player or computer first? (choose 'player' or 'computer')")
        turn = gets.chomp
        break if turn == 'player' || turn == 'computer'
        prompt("please choose again")
      end
    end

    current_player = turn
    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      case detect_winner(board)
      when 'Computer'
        computer += 1
        prompt "#{detect_winner(board)} won! #{show_score(computer)}"
        sleep(2)
      when 'Player'
        player += 1
        prompt "#{detect_winner(board)} won! #{show_score(player)}"
        sleep(2)
      end
    else
      prompt "It's a tie!"
      sleep(2)
    end
    break if computer == 5 || player == 5
  end

  prompt("Do you want to play again? (y/n)")

  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for playing tic tac toe')
