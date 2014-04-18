# Better profiling

# def profile block_description, &block
#   return   # Turns off all profiling!
#   start_time = Time.new
#   block.call
#   duration = Time.new - start_time
#   puts "#{block_description}:  #{duration} seconds"
# end
# profile '25000 doublings' do
#   number = 1
#   25000.times do
#     number = number + number
#   end
#   puts "#{number.to_s.length} digits"
#   #  That's the number of digits in this HUGE number.
# end
# profile 'count to a million' do
#   number = 0
#   1000000.times do
#     number = number + 1
#   end
# end

# Grandfather clock

# def chime_the_hour &block
#   hour = Time.new.hour
#   if hour > 12
#     hour -= 12
#   end
#   until hour == 0 do
#     block.call
#     hour -= 1
#   end
# end

# chime_the_hour do
#   puts "DONG!"
# end

# chime_the_hour do
#   puts "All is well!"
# end


#Program logger

# def logger desc, &block
#   puts "Beginning \"#{desc}\"..."
#   ret = block.call
#   puts "...\"#{desc}\" finished, returned: #{ret}"
# end

# logger "outer block" do
#   logger "some little block" do
#     5
#   end
#   logger "yet another block" do
#     "I like Thai food!"
#   end
#   false
# end


#Better logger

$indent = 0

def indent_string str
  ret = ""
  $indent.times do
    ret += "  "
  end
  ret += str
  return ret
end

def logger desc, &block
  puts indent_string "Beginning \"#{desc}\"..."
  $indent += 1
  ret = block.call
  $indent -= 1
  puts indent_string "...\"#{desc}\" finished, returned: #{ret}"
end

logger "outer block" do
  logger "some little block" do
    logger "teeny-tiny block" do
      "lots of love"
    end
    42
  end
  logger "yet another block" do
    "I like Indian food!"
  end
  false
end



