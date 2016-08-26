numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
p numbers

# 1. we will print all number 1,2,3,4
# 2. return 1 , 2 , 3 ,4
# 3. numbers array remain unchanged at [1,2,3,4]



numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# 1. output 1, 2