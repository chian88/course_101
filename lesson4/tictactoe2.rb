require 'pry'

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

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square #{joinor(empty_square(brd))}:"
    square = gets.chomp.to_i
    break if empty_square(brd).include?(square)
    prompt("Sorry not a valid choice.")
  end
  brd[square] = PLAYER_MARKER
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def computer_places_piece!(brd)
  square = empty_square(brd).sample
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2 && brd.values_at(*line).count(INITIAL_MARKER) == 1
      square = line.select { |num| brd[num] == INITIAL_MARKER }.first
      break
    end
  end
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_square(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def show_score(score)
  prompt("(#{score}/5)")
end

loop do
    loop do
    board = initialize_board
      loop do
        display_board(board)
    
        player_places_piece!(board)
        break if someone_won?(board) || board_full?(board)
    
        computer_places_piece!(board)
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
