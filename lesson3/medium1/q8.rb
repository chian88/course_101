statement = "Welcome to my web page"

new_statement = []
statement.split().each do |word|
  new_statement << word.capitalize()
end

p new_statement.join(' ')




# OR , as per solution

words = "This is the solution answer"

p words.split.map { |word| word.capitalize }.join(' ')

