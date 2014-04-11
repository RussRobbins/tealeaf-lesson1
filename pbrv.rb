def comp_non_mut array
  array.compact
end

def comp_mut array
  array.compact!
end

test = [1,2,nil,3,4,4,nil]
puts "Non-mutating compact method returns: " + (comp_non_mut test).to_s
puts "Array value after call is: " + test.to_s

test = [1,2,nil,3,4,4,nil]
puts "Mutating compact method returns: " + (comp_mut test).to_s
puts "Array value after call is: " + test.to_s
