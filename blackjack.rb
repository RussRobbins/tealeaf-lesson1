new_deck = [
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
]

def pick_a_card(from_deck)
  s = rand(4)
  r = rand(13)
  if from_deck[s][r] == 1
    from_deck[s][r] = 0
    return [s, r]
  else
    pick_a_card from_deck
  end
end

def card_name(card)
  rank_names = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"];
  suit_names = ["Clubs", "Hearts", "Spades", "Diamonds"]
  rank_names[card[1]] + " of " + suit_names[card[0]]
end

def hand_string(hand)
  ret = "Your hand: "
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
    if rank == 1
      num = 0
      while (num != 1 && num != 11) do
        puts "Do you want the " + card_name(card) + " to be a 1 or 11?"
        num = gets.chomp.to_i
        if num == 1 || num == 11
          ret_hand[index][1] = 0
        elsif num == 11
          ret_hand[index][1] = 13
        else
          puts "Enter a 1 or 11!"
        end
      end
    end
  }
  ret_hand
end



# Meet and greet
# puts "Hello! And what is your name?"
# name = gets.chomp
# puts "Welcome to Blackjack, #{name}!"
# puts ""
# 
# puts "Hit <Enter> to shuffle and deal!"
# gets
# puts "Shuffling..."

deck = new_deck
player_hand = [pick_a_card(deck), pick_a_card(deck)]

#puts "You were dealt: " + card_name(player_card_1, rank_names, suit_names) + " and " + card_name(player_card_2, rank_names, suit_names) + "."
puts hand_string(player_hand)

# TODO: Handle special case of an Ace

puts "Your point total is " + count_hand(player_hand).to_s + "."

cmd = ""
while cmd != "s" do
  puts ""
  puts "=> Do you want to (h)it or (s)tay?"
  cmd = gets.chomp.downcase
  if (cmd == "h")
    new_card = pick_a_card deck
    puts "You drew the " + card_name(new_card) + "."
    # TODO: Handle special case of an Ace
    player_hand.push(new_card)
    puts hand_string(player_hand)
    puts "Your point total is " + count_hand(player_hand).to_s + "."
    if count_hand(player_hand) > 21
      break
    end
  elsif (cmd == "s")
    #Do nothing, we'll exit the loop
  else
    puts "Enter 'h' to Hit, or 's' to Stay."
  end
end



