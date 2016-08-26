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

def display_result_human(human_score, computer_score)
  prompt("You have won this round. \nYour score:#{human_score}
Computer score:#{computer_score}")
end

def display_result_computer(human_score, computer_score)
  prompt("Computer have won this round. \nYour score:#{human_score}
Computer score:#{computer_score}")
end

def display_result_tie(human_score, computer_score)
  prompt("It's a tie this round.
Your score:#{human_score}. \nComputer score:#{computer_score}")
end

loop do
  loop do
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICE.join(', ')}. Mode: best of five")
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

    case choice
    when 'r'
      if computer_choice == 'sc' || computer_choice == 'l'
        human_score += 1
        display_result_human(human_score, computer_score)

      elsif computer_choice == 'p' || computer_choice == 'sp'
        computer_score += 1
        display_result_computer(human_score, computer_score)
      else
        display_result_tie(human_score, computer_score)
      end

    when 'p'
      if computer_choice == 'sp' || computer_choice == 'r'
        human_score += 1
        display_result_human(human_score, computer_score)
      elsif computer_choice == 'sc' || computer_choice == 'l'
        computer_score += 1
        display_result_computer(human_score, computer_score)
      else
        display_result_tie(human_score, computer_score)
      end

    when 'sc'
      if computer_choice == 'p' || computer_choice == 'l'
        human_score += 1
        display_result_human(human_score, computer_score)
      elsif computer_choice == 'r' || computer_choice == 'sp'
        computer_score += 1
        display_result_computer(human_score, computer_score)
      else
        display_result_tie(human_score, computer_score)
      end

    when 'sp'
      if computer_choice == 'r' || computer_choice == 'sc'
        human_score += 1
        display_result_human(human_score, computer_score)
      elsif computer_choice == 'p' || computer_choice == 'l'
        computer_score += 1
        display_result_computer(human_score, computer_score)
      else
        display_result_tie(human_score, computer_score)
      end

    when 'l'
      if computer_choice == 'p' || computer_choice == 'sp'
        human_score += 1
        display_result_human(human_score, computer_score)
      elsif computer_choice == 'r' || computer_choice == 'sc'
        computer_score += 1
        display_result_computer(human_score, computer_score)
      else
        display_result_tie(human_score, computer_score)
      end
    end

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
