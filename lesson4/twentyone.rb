require 'pry'

def prompt(msg)
  puts "=> #{msg}"
end

# build a data representation of the real thing {}
def initialize_deck
  new_deck = {}
  ['S', 'H', 'D', 'C'].each do |suit|
    (2..10).each do |digit|
      new_deck[suit + digit.to_s] = digit
    end
  end
  ['S', 'H', 'D', 'C'].each { |suit| new_deck[suit + 'A'] = 11 }
  ['S', 'H', 'D', 'C'].each do |suit|
    ['J', 'Q', 'K'].each do |name|
      new_deck[suit + name] = 10
    end
  end
  new_deck
end

DECK = initialize_deck

def sum_card(player_card)
  sum = 0
  player_card.each { |card| sum += DECK.fetch(card) }
  player_card.select { |value| value.split("").include?("A") }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

def busted?(card_value)
  card_value > 21
end

def starting_display
  puts "------------------------BLACKJACK-------------------------------"
  prompt("S for spade, H for hearts, D for Diamond, C for Club")
  prompt("J for jack, Q for queen, K for King, A for Ace")
end

# play again loop
loop do
  starting_display
  player_card = DECK.keys.sample(2)
  dealer_card = DECK.keys.sample(2)
  player_value = sum_card(player_card)
  dealer_value = sum_card(dealer_card)
  prompt("Dealer's first card is #{dealer_card[0]}")
  prompt("Your card is #{player_card.join(', ')}. Value: #{player_value}")

  # player's turn
  loop do
    answer = ''
    loop do
      prompt("hit or stay?") # validation loop
      answer = gets.chomp
      break if answer == 'hit' || answer == 'stay'
      prompt("invalid reply")
    end
    if answer == 'hit'
      new_card = ''
      loop do # make sure not duplicate cox DECK is constant.
        new_card = DECK.keys.sample
        break unless player_card.include?(new_card)
      end
      player_card << new_card
      player_value = sum_card(player_card)
      prompt("Your card now is #{player_card.join(', ')}.\
 Value: #{player_value}")
    end
    break if answer == 'stay' || busted?(player_value)
  end

  if busted?(player_value)
    prompt("You have busted!")
    prompt("play again ? (y or n)")
    reply = gets.chomp
    next if reply == 'y'
    prompt("thank you for playing")
    break
  end

  # dealer's turn
  loop do
    break if dealer_value >= 17
    new_card = ''
    loop do
      new_card = DECK.keys.sample
      break unless dealer_card.include?(new_card)
    end
    dealer_card << new_card
    dealer_value = sum_card(dealer_card)
  end

  prompt("Dealer card is #{dealer_card.join(', ')}. Value: #{dealer_value}")

  if busted?(dealer_value)
    prompt("Dealer has busted!")
    prompt("play again ? (y or n)")
    reply = gets.chomp
    next if reply == 'y'
    prompt("thank you for playing")
    break
  end

  # compare score
  if player_value > dealer_value
    prompt("player won!")

  elsif player_value < dealer_value
    prompt("dealer won!")
  else
    prompt("It's a tie")
  end
  prompt("play again ? (y or n)")
  reply = gets.chomp
  next if reply == 'y'
  prompt("thank you for playing")
  break
end
