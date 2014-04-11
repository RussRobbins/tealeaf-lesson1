test = [1,2,3,4,4]

# Re-assign
i = 0
while i<1 do
  test = ['a','b','c']
  i += 1
end
puts test.to_s

test = [1,2,3,4,4]

# Non-mutating method
i = 0
while i<1 do
  test.uniq
  i += 1
end
puts test.to_s   # Doesn't change it

test = [1,2,3,4,4]

# Re-assign
i = 0
while i<1 do
  test.uniq!
  i += 1
end
puts test.to_s   # Does change it
