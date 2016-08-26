# CODE A

def mess_with_vars(one, two, three)
  one = two  # a new varaible was assigned for one = 'two'
  two = three # a new variable was assigned for two = 'three'
  three = one # a new variabe was assigned for three = 'one'
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# one = 'one'
# two = 'two'
# three = 'three'

# because (assignment operators) forgots about the reference that was passed 
# into the method and assign a new variable for the new value


# CODE B 

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # 'one'
puts "two is: #{two}" # 'two'
puts "three is: #{three}" # 'three'

# a new variable was created inside the method. 
# The method has forgotten about the variable that points to the original variable outside of the method.


# CODE C

def mess_with_vars(one, two, three)
  one.gsub!("one","two")  
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"  # 'two'
puts "two is: #{two}"  # 'three'
puts "three is: #{three}"  # 'one'

# in this case, the variable that points to the variable outside the method was altered by the method gsub!