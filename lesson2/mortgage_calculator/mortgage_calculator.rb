require 'yaml'
MESSAGES = YAML.load_file('mortgage_message.yml')

# add a => in front of every message (presentation) - for non-configuration file
def prompt(msg)
  Kernel.puts("=> " + msg)
end

# to extract string from mortgage_calculator.yml, which is a hash data type
# en is the default language
def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

# add a => in front of every message (presentation) - for configuration file
def prompt2(key)
  msg = messages(key, LANGUAGE)
  Kernel.puts("=> " + msg)
end

# checks whether is number or not : float or integer.
def number?(num)
  integer?(num) || float?(num)
end

# checks whether is float or not :
def float?(num)
  num.to_f.to_s == num
end

# checks whether is integer or not :

def integer?(num)
  num.to_i.to_s == num
end

# convert payment format numbers into verbs

def pay_verb(pay_format)
  case pay_format
  when '1'
    'monthly'
  when '2'
    'yearly'
  end
end

# ask user whether is english or spanish >> checks whether is 1 or 2
prompt("1) English 2)Español")

language = ''
loop do
  language = Kernel.gets().chomp()
  if %w(1 2).include?(language)
    break
  else
    prompt("Please enter 1 or 2 only")
  end
end

LANGUAGE = case language
           when '1'
             'en'
           when '2'
             'es'
           end

# welcome message
prompt2('welcome')

# taking name  >> check whether name is empty or not
prompt2('name')

user_name = ''
loop do
  user_name = Kernel.gets().chomp()
  if user_name =~ /^\s*$/
    prompt2('valid_name')
  else
    break
  end
end

# greets user
prompt("Hi #{user_name}, nice to meet you")
loop do
  # take in mortgage amount >> check whether the loans is a number or not.
  prompt2('mortgage_amount')

  mortgage_amount = ''
  loop do
    mortgage_amount = Kernel.gets().chomp()
    if number?(mortgage_amount)
      break
    else
      prompt2('valid_number')
    end
  end

  # take in annual percentage rates (APR) >> checks whether is number or not.
  prompt2('annual_rate')

  annual_rate = ''
  loop do
    annual_rate = Kernel.gets().chomp()
    if number?(annual_rate)
      break
    else
      prompt2('valid_number')
    end
  end

  # conversion from APR to monthly interest rates
  mth_rate = (annual_rate.to_f() / 100 / 12)

  # take in the loan duration
  prompt2('loan_duration')

  loan_month = ''

  loop do
    loan_month = Kernel.gets().chomp()
    if integer?(loan_month)
      break
    else
      prompt2('valid_integer')
    end
  end

  payment_message = <<-MSG
Do you like to pay yearly or monthly?
    1) Monthly
    2) Yearly

  MSG
  prompt(payment_message)

  # get the payment format in 1) or 2). >>
  # verify that the payment format is either #1 or #2
  payment_format = ''
  loop do
    payment_format = Kernel.gets().chomp()
    if %w(1 2).include?(payment_format)
      break
    else
      prompt2('one_two')
    end
  end

  # loan summary
  prompt("If you borrow $#{mortgage_amount} for #{loan_month} months\
  at #{format('%.2f', annual_rate.to_f())} % interest rates per annum ")

  # calculate the monthly payment

  prompt("Your #{pay_verb(payment_format)} payments will be..")

  puts("-----------processing--------------")

  payment = case payment_format
            when '1'
              mortgage_amount.to_f() *
              (mth_rate / (1 - (1 + mth_rate)**-loan_month.to_i()))
            when '2'
              (mortgage_amount.to_f() *
              (mth_rate / (1 - (1 + mth_rate)**-loan_month.to_i()))) * 12
            end

  prompt("Your #{pay_verb(payment_format)} payments is\
  $#{format('%.2f', payment)}.")

  prompt2('try_again')

  calc_again = Kernel.gets().chomp()

  break unless calc_again.casecmp('y').zero?()
end

prompt2('ending')
