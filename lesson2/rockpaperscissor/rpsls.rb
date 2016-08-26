VALID_CHOICE = %w(r p sc l sp)
computer_score = 0
human_score = 0

def prompt(message)
  Kernel.puts(" => #{message}")
end

def choice_to_text(choice)
  case choice
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 'sc'
    'scissors'
  when 'l'
    'lizard'
  when 'sp'
    'spock'
  end
end

# write the logic to determine win condition for 'first player'.

def win?(first, second)
  (first == 'r' && second == 'sc') ||
    (first == 'r' && second == 'l') ||
    (first == 'p' && second == 'r') ||
    (first == 'p' && second == 'sp') ||
    (first == 'sc' && second == 'p') ||
    (first == 'sc' && second == 'l') ||
    (first == 'sp' && second == 'r') ||
    (first == 'sp' && second == 'sc') ||
    (first == 'l' && second == 'p') ||
    (first == 'l' && second == 'sp')
end

def display_result(player, computer, human_score, comp_score)
  if win?(player, computer)
    prompt("You have won this round. \nYour score:#{human_score}
Computer score:#{comp_score}")
  elsif win?(computer, player)
    prompt("Computer have won this round. \nYour score:#{human_score}
Computer score:#{comp_score}")
  else
    prompt("It's a tie this round.
Your score:#{human_score}. \nComputer score:#{comp_score}")
  end
end

loop do
  loop do
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICE.join(', ')}. Best of five")
      prompt("'r' stands for rock, 'p' stands for paper,\
 'sc' stands for scissors, 'l' stands for lizard, 'sp' stands for spock")
      choice = Kernel.gets().chomp()

      if VALID_CHOICE.include?(choice)
        break
      else

        prompt("Please enter a valid choice.")
      end
    end

    computer_choice = VALID_CHOICE.sample()

    prompt("Your choice is #{choice_to_text(choice)} AND computer choice is\
 #{choice_to_text(computer_choice)}")

    human_score += 1 if win?(choice, computer_choice)

    computer_score += 1 if win?(computer_choice, choice)

    display_result(choice, computer_choice, human_score, computer_score)

    if computer_score == 5
      prompt("Computer has won the game")
      break
    end

    if human_score == 5
      prompt("You have won the game")
      break
    end
  end

  prompt("Do you want to play again? ('y' to continue)")
  break unless Kernel.gets().chomp().downcase().start_with?('y')
end

prompt("Thank you for playing !")
