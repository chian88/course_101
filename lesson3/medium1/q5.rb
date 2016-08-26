def factors(number)
  dividend = number
  divisors = []
  case 
  when number > 0
    loop do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
    break if dividend == 0
    end 
  when number < 0
    return "No negative numbers"
  when number == 0
    return "Division by zero"
  end
  divisors
end

p factors(0)
p factors(1000)
p factors(-100)

# bonus 1

# to make sure that number is divisible by dividend with no remainder

# bonus 2

# this is for the method to return the array 'divisor'. The last expression gets returned in any method.