require 'pry'

# class Integer
#   def !
#     if self < 0
#       NAN
#     elsif self <= 1
#       1
#     else
#       self * (self - 1).!
#     end
#   end
# end

# puts 12.!

# class Integer
#   def roman
#     keys = [
#       [1000, "M"],
#       [500, "D"],
#       [100, "C"],
#       [50, "L"],
#       [10, "X"],
#       [5, "V"],
#       [1, "I"],
#     ]

#     ret = ""
#     num = self
#     keys.each_with_index do |pair, index|
#       numeral = pair[0]
#       letter = pair[1]
#       if index>0
#         last_numeral = keys[(index-1)][0]
#         last_letter = keys[(index-1)][1]
#       else
#         last_numeral = 1
#         last_letter = ""
#       end
#       while (num - numeral) >= 0
#         comp = num - (num % numeral)
#         if (comp + numeral) == last_numeral
#           ret += letter + last_letter
#           num = num - (last_numeral - numeral)
#         else
#           ret += letter
#           num = num - numeral
#         end
#       end
#     end
#     return ret
#   end
# end

# puts 2014.roman

# class Die
#   def initialize
#     roll
#   end
#   def roll
#     @number = 1 + rand(6)
#   end
#   def num
#     @number
#   end
#   def set num
#     case num
#     when(1..6)
#       @number = num
#     end
#   end
# end

# d = Die.new
# puts d.num
# d.set (7)
# puts d.num



# class Dragon
#   def initialize name
#     @name = name
#     @asleep = false
#     @stuff_in_belly     = 10  #  He's full.
#     @stuff_in_intestine =  0  #  He doesn't need to go.
#     puts "#{@name} is born."
#   end
#   def feed
#     puts "You feed #{@name}."
#     @stuff_in_belly = 10
#     passage_of_time
#   end
#   def walk
#     puts "You walk #{@name}."
#     @stuff_in_intestine = 0
#     passage_of_time
#   end
#   def put_to_bed
#     puts "You put #{@name} to bed."
#     @asleep = true
#     3.times do
#       if @asleep
#         passage_of_time
#       end
#       if @asleep
#         puts "#{@name} snores, filling the room with smoke."
#       end
#     end
#     if @asleep
#       @asleep = false
#       puts "#{@name} wakes up slowly."
#     end
#   end
#   def toss
#     puts "You toss #{@name} up into the air."
#     puts 'He giggles, which singes your eyebrows.'
#     passage_of_time
#   end
#   def rock
#     puts "You rock #{@name} gently."
#     @asleep = true
#     puts 'He briefly dozes off...'
#     passage_of_time
#     if @asleep
#       @asleep = false
#       puts '...but wakes when you stop.'
#     end
#   end
#   private
#   #  "private" means that the methods defined here are
#   #  methods internal to the object.  (You can feed your
#   #  dragon, but you can't ask him whether he's hungry.)
#   def hungry?
#     #  Method names can end with "?".
#     #  Usually, we do this only if the method
#     #  returns true or false, like this:
#     @stuff_in_belly <= 2
#   end
#   def poopy?
#     @stuff_in_intestine >= 8
#   end
#   def passage_of_time
#     if @stuff_in_belly > 0
#       #  Move food from belly to intestine.
#       @stuff_in_belly     = @stuff_in_belly     - 1
#       @stuff_in_intestine = @stuff_in_intestine + 1
#     else  #  Our dragon is starving!
#       if @asleep
#         @asleep = false
#         puts 'He wakes up suddenly!'
#       end
#       puts "#{@name} is starving!  In desperation, he ate YOU!"
#       exit  #  This quits the program.
#     end
#     if @stuff_in_intestine >= 10
#       @stuff_in_intestine = 0
#       puts "Whoops!  #{@name} had an accident..."
#     end
#     if hungry?
#       if @asleep
#         @asleep = false
#         puts 'He wakes up suddenly!'
#       end
#       puts "#{@name}'s stomach grumbles..."
#     end
#     if poopy?
#       if @asleep
#         @asleep = false
#         puts 'He wakes up suddenly!'
#       end
#       puts "#{@name} does the potty dance..."
#     end
#   end
# end

# def process(pet, cmd)
#   case cmd
#   when "f"
#     pet.feed
#   when "w"
#     pet.walk
#   when "b"
#     pet.put_to_bed
#   when "t"
#     pet.toss
#   when "r"
#     pet.rock
#   when "q"
#     exit
#   end
# end

# puts "Name your dragon:"
# name = gets.chomp
# pet = Dragon.new name

# while true do
#   puts "\nThings you can do with #{name}: (f)eed, (w)alk, put to (b)ed, (t)oss in the air, (r)ock, or (q)uit."
#   cmd = gets.chomp
#   process(pet, cmd)
# end


# Orange tree plan -
# Begins bearing fruit at age 5
# Height begins at 2 feet, and grows 0.5 foot per year
# Number of oranges once it's 5yo = age*10, with a max of 300 (at age 30)
# Dies at age 40

class OrangeTree
  def initialize
    @age = 1
    @height = 2.0
    @orange_count = 0
    puts "You plant your orange tree."
  end
  def one_year_passes
    @age += 1
    @height += 0.5
    @orange_count = calc_new_orange_count
    if @age < 40
      puts "Your tree ages one year. It is now #{@age} years old, is #{@height} feet tall, and has #{@orange_count} oranges on it."
    else
      puts "Unfortunately, your tree has died of old age.  But it lived a long, productive life!"
      exit
    end
  end
  def count_oranges
    puts "The tree currently has #{@orange_count} oranges."
  end
  def pick_orange
    if @age < 5
      puts "Your tree is not old enough yet to bear fruit."
    elsif @orange_count > 0
      @orange_count -= 1
      puts "You pick a big, juicy orange and proceed to enjoy it.  Sweet!"
    else
      puts "There are no oranges left on the tree."
    end
  end

  private
  def calc_new_orange_count
    case @age
    when 1..4
      0
    else
      [(@age*8), 300].min
    end
  end
end

def handle(tree, cmd)
  case cmd
  when "c"
    tree.count_oranges
  when "p"
    tree.pick_orange
  when "w"
    tree.one_year_passes
  when "q"
    exit
  end
end


tree = OrangeTree.new

while true do
  puts "\nThings you can do: (c)ount oranges, (p)ick an orange, (w)ait a year, (q)uit."
  cmd = gets.chomp
  handle(tree, cmd)
end
