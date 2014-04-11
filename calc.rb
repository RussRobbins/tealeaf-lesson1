require 'pry'

def say(msg)
  puts "=> #{msg}"
end


say "Enter first number:"
num1 = gets.chomp

say "Enter second number:"
num2 = gets.chomp

say "1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp

binding.pry

if operator.to_i == 1
  result = num1.to_i + num2.to_i
elsif operator.to_i == 2
  result = num1.to_i - num2.to_i
elsif operator.to_i == 3
  result = num1.to_i * num2.to_i
else
  result = num1.to_f / num2.to_f
end

puts "Result is #{result}"
