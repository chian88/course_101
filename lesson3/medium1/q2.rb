statement = "The Flintstones Rock"
# split the character
char = statement.gsub(/\s+/, "").split("").uniq()

array = {}
char.each do |character|
  array[character] = statement.count(character)
end

p array


# OR according to the solution.

result = {}
letters = ("A".."Z").to_a() + ("a".."z").to_a()

letters.each do |letter|
  letter_frequency = statement.scan(letter).count()
  result[letter] = letter_frequency if letter_frequency > 0
end

p result

