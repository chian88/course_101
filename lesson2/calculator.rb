# calculator ruby code

#1. ask the user the first number
#2. ask the user the second number
#3. ask the user the operation to perform.
#4. perform the operation.

Kernel.puts("Welcome to the calculator")  

Kernel.puts("what is the first number?")
number1 = Kernel.gets().chomp()

Kernel.puts("what is the second number?")
number2 = Kernel.gets().chomp()

Kernel.puts("What operation you like to perform? 1) addition 2) substraction 3) multipication 4)division")
operation = Kernel.gets().chomp()

if operation == '1'
  result = number1.to_i() + number2.to_i()
elsif operation == '2'
  result = number1.to_i() - number2.to_i()
elsif operation == '3'
  result = number1.to_i() * number2.to_i()
else 
  result = number1.to_f() / number2.to_f() #result became floats.
end

Kernel.puts("The number is: #{result}")