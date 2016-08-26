if false
  greeting = “hello world”
  
end

p greeting

# i will expect an error because 
# 1. it is a false statement, hence the greeting variable wasn't initialize.
# 2. we can't access scope that is inside a block.


# answer:
# 1. It is nil. 
# 2. when you initialize a local variable within an if block, even if that if block doesn’t get executed, 
# 3. the local variable is initialized to nil.