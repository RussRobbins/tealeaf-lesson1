require 'pry'

def new_deck
  [
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
  ]
end

def pick_a_card(from_deck)
  suit = rand(4)
  rank = rand(13)
  if from_deck[suit][rank] == 1
    from_deck[suit][rank] = 0
    return [suit, rank]
  else
    pick_a_card from_deck
  end
end

def card_name(card)
  rank_names = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"];
  suit_names = ["Clubs", "Hearts", "Spades", "Diamonds"]
  rank_names[card[1]] + " of " + suit_names[card[0]]
end

def hand_string(hand, str)
  ret = str
  for card in hand
    ret += card_name(card) + ", "
  end
  ret.chomp(", ")
end

def count_hand(hand)
  rank_values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
  num = 0
  for card in hand
    num += rank_values[card[1]]
  end
  num
end

def ask_about_aces(player_hand)
  ret_hand = player_hand
  ret_hand.each_with_index {|card, index|
    rank = card[1]
    if rank == 0
      num = 0
      while (num != 1 && num != 11) do
        puts "Do you want the " + card_name(card) + " to be a 1 or 11?"
        num = gets.chomp.to_i
        if num == 1
          ret_hand[index][1] = 0
        elsif num == 11
          ret_hand[index][1] = 13
        else
          puts "Enter a 1 or 11!"
          puts ""
        end
      end
    end
  }
  ret_hand
end

def handle_dealer_aces(dealer_hand)
  ret_hand = dealer_hand
  ret_hand.each_with_index {|card, index|
    rank = card[1]
    if rank == 0
      # Force the ace to count as 11 and check the count
      ret_hand[index][1] = 13
      # if that makes her bust, revert to counting it as a 1
      if check_dealer_hand(ret_hand) == -1
        ret_hand[index][1] = 0
        puts "The dealer counts the " + card_name(card) + " as a 1."
      else
        puts "The dealer counts the " + card_name(card) + " as an 11."
      end
    end
  }
  ret_hand
end

# Returns 1 if dealer's hand total is between 17 and 21 inclusive, 0 if it's less than 17,
#   and -1 if the dealer has busted
def check_dealer_hand(dealer_hand)
  case count_hand(dealer_hand)
  when 2..16
    return 0
  when 22..100
    return -1
  else
    return 1
  end
end

def pick_dealer_name
  names = ["Buff Barry", "Lovely Lisa", "Rough Roberto", "Sassy Sheila", "Shifty-eyed Sam", "Slick Sally"]
  names[rand(6)]
end

# Meet and greet
puts "Hello! And what is your name?"
player_name = gets.chomp
puts "Welcome to Blackjack, #{player_name}!"
dealer_name = pick_dealer_name
puts "Your dealer today is #{dealer_name}."
puts ""
puts "Hit <Enter> to shuffle and deal!"
gets

#Start big loop here
cont = true
while cont == true do
  puts "Shuffling..."
  puts ""
  deck = new_deck

  player_hand = [pick_a_card(deck), pick_a_card(deck)]
  #player_hand = [[2,0], pick_a_card(deck)]
  puts hand_string(player_hand, "Your hand: ")
  
  # TODO: Handle special case of an Ace
  player_hand = ask_about_aces(player_hand)
  
  puts "Your point total is " + count_hand(player_hand).to_s + "."
  
  cmd = ""
  while cmd != "s" do
    puts ""
    puts "=> Do you want to (h)it or (s)tay?"
    cmd = gets.chomp.downcase
    if (cmd == "h")
      new_card = pick_a_card deck
      #new_card = [1,0]
      puts "You drew the " + card_name(new_card) + "."
      player_hand.push(new_card)
      if (new_card[1] == 0 && count_hand(player_hand) <= 21)
        player_hand = ask_about_aces(player_hand)
      end
      puts hand_string(player_hand, "Your hand: ")
      puts "Your point total is " + count_hand(player_hand).to_s + "."
      if count_hand(player_hand) >= 21
        break
      end
    elsif (cmd == "s")
      #Do nothing, we'll exit the loop
    else
      puts "Enter 'h' to Hit, or 's' to Stay."
    end
  end
  
  if count_hand(player_hand) > 21
    puts "You BUSTED!  Better luck next time, #{player_name}."
  elsif count_hand(player_hand) == 21
    puts "You got 21, #{player_name}!  You WIN!!"
  else
    puts "#{player_name}, you have decided to stay with a total of " + count_hand(player_hand).to_s + "."
    puts ""
    
    dealer_hand = [pick_a_card(deck), pick_a_card(deck)]
    #dealer_hand = [[2,0], pick_a_card(deck)]
    puts hand_string(dealer_hand, "#{dealer_name}'s hand: ")
    dealer_hand = handle_dealer_aces(dealer_hand)
    puts "#{dealer_name}'s point total is " + count_hand(dealer_hand).to_s + "."
    puts ""
    
    while true do
      case check_dealer_hand(dealer_hand)
      when -1  #Dealer busted
        puts "#{dealer_name} has BUSTED! You win!!"
        break
      when 0   #Dealer needs to draw, decide on an ace if appropriate
        new_card = pick_a_card(deck)
        puts "#{dealer_name} HITS and draws the " + card_name(new_card) + "."
        dealer_hand.push(new_card)
        if (new_card[1] == 0 && count_hand(dealer_hand) <= 21)
          dealer_hand = handle_dealer_aces(dealer_hand)
        end
        puts hand_string(dealer_hand, dealer_name + "'s hand: ")
        puts "#{dealer_name}'s point total is " + count_hand(dealer_hand).to_s + "."
        puts ""
      else
        puts "#{dealer_name} decides to STAY with a point total of " + count_hand(dealer_hand).to_s + "."
        break
      end
    end
    
    # More to say if neither player busted
    player_pts = count_hand(player_hand) 
    dealer_pts = count_hand(dealer_hand) 
    if (player_pts <= 21 && dealer_pts <= 21)
      puts ""
      if dealer_pts > player_pts
        puts "#{dealer_name}'s score of #{dealer_pts} beats your score of #{player_pts}. Sorry #{player_name}, you LOSE!"
      elsif dealer_pts < player_pts
        puts "Your score of #{player_pts} beats #{dealer_name}'s score of #{dealer_pts}. You WIN, #{player_name}!!"
      else
        puts "Looks like it's a DRAW!  You both had scores of #{player_pts}."
      end
    end
  end
  
  # See if they want to play again
  puts ""
  puts "=> Type 'exit' to quit, or anything else to play again:"
  input = gets.chomp
  if input == "exit"
    cont = false
  end
end

