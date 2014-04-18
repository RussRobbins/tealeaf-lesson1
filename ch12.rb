# Billion seconds
# birthday = Time.local(1968, 7, 11, 17, 15)
# puts "My birthdate: #{birthday}"
# puts "My billion-second birthday: #{birthday + 1000000000}"


# Happy Birthday!
# puts "What year were you born in (4-digit number)?"
# year = gets.chomp
# puts "What month were you born in (type the number, not the name)?"
# month = gets.chomp
# puts "And on what day in that month were you born?"
# day = gets.chomp
# 
# birthday = Time.local(year, month, day)
# today = Time.new
# years_old = ((today - birthday) / (365*24*60*60)).to_int
# puts years_old
# puts "Your birthday was #{birthday}? That makes you #{years_old} years old!"
# puts "Time for your spanking!"
# i = 0
# while i < years_old do
  # puts "SPANK!"
  # i += 1
# end


# def roman_to_integer roman_number
#   digits = {
#     'i' =>    1,
#     'v' =>    5,
#     'x' =>   10,
#     'l' =>   50,
#     'c' =>  100,
#     'd' =>  500,
#     'm' => 1000
#   }
#   total = 0
#   prev  = 0
#   roman_number.reverse.each_char do |letter|
#     l   = letter.downcase
#     val = digits[l]
#     if !val
#       puts "#{roman_number} is not a valid Roman numeral."
#       return
#     end
#     if val < prev
#       val *= -1
#     else
#       prev = val
#     end
#     total += val
#   end
#   return total
# end

# puts("CMXCIX is: " + roman_to_integer('cmxcix').to_s)
# puts "\nEnter your own Roman numeral to compute the value of:"
# r = gets.chomp
# puts roman_to_integer r


birthdays = {}
File.readlines('birthdays.txt').each do |line|
  name, date, year = line.split(',')
  birthdays[name] = Time.gm(year, *(date.split))
end
#puts birthdays
puts "Whose birthday shall I look up?"
look_name = gets.chomp
bday = birthdays[look_name]
if !bday
  puts "Sorry, I couldn't find #{look_name}."
else
  today = Time.new
  age = today.year - bday.year
  if today.month > bday.month || (today.month == bday.month && today.day > bday.day)
    age += 1
  end
  if today.month == bday.month && today.day == bday.day
    puts "#{look_name}'s birthday is today!  He turns #{age}."
  else
    puts "#{look_name} turns #{age} on #{bday}."
  end
end

