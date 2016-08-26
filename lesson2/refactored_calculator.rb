require 'yaml'
MESSAGES = YAML.load_file('calculator_message.yml')
LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

def prompt2(message)
  Kernel.puts("=> #{message}")
end

def number?(input)
  integer?(input) || float?(input)
end 

def integer?(integer) #check validity of integer function
  integer.to_i.to_s == integer
end

def float?(float)
  Float(float) rescue false
end

def operation_to_message(operator)
  verb = case operator
  when '1'
    'adding'
  when '2'
    'subtracting'
  when '3'
    'multiplying'
  when '4'
    'dividing'
  end
  return verb
end

prompt('welcome')

name = ''
loop do #checks name validity
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

prompt2("Hi #{name}") #greet user

loop do # main loop *********
  number1 = '' #initialize variable number
  loop do #check validity of numbers entered
    prompt('first_number')
    number1 = Kernel.gets().chomp() #number1 is actually a string.
    if number?(number1) #return any number if it is number , so evaluates to true.
      break #break from the loop goes to number2
    else
      prompt('something_wrong') #return false if it is not number. So prompt user that something is wrong
    end
  end

  number2 = ''
  loop do
    prompt('second_number')
    number2 = Kernel.gets().chomp()
    if number?(number2)
      break
    else
      prompt('something_wrong')
    end
  end

  operator_prompt = <<-MSG
What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt2(operator_prompt)

  operation = ''
  loop do
    operation = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt('valid_number')
    end
  end

  result = case operation
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt2("#{operation_to_message(operation)} the two numbers....")

  prompt2("The number is: #{result}")

  prompt('use_again')
  answer = gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt('thank_you')
