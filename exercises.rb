#[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each {|a| puts a}

#[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each {|a| puts a if a > 5}

#puts [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].select {|a| a%2 == 1}

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr << 11
arr.unshift 0
#puts arr.to_s

arr.pop
arr << 3
#puts arr.to_s

arr.uniq!
#puts arr.to_s

# Array is an ordered list; a hash is an unordered set of key-value pairs.

# Ruby 1.8
h = {:a=> 1, :b=> 2, :c=> 3}
# Ruby 1.9
h = {a: 1, b: 2, c: 3}
#puts h.to_s

h = {a:1, b:2, c:3, d:4}
#puts h[:b]

h[:e] = 5
#puts h
h = h.delete_if{|k,v| v < 3.5}
#puts h

# Yes, and Yes
h = {a: [1,2,3], b: [4,5,6]}
#puts h

arr = [{a:1, b:2}, {c:3, d:4}, "e"]
puts arr.to_s

