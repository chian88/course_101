#the pseudocode to return the greatest number within a list of numbers.

START

# Given a collection of integers called "numbers"
SET iterator = 1
SET saved_number = value within numbers collection at space 1

WHILE iterator < length of numbers
  SET current_number = value within numbers collection at space "iterator"
  IF saved_number >= current_number
    go to the next iteration
  ELSE
    saved_number = current_number

  iterator = iterator + 1

PRINT saved_number

END





# a method that returns the sum of two integers.
START

GET number1
GET number2
answer = number1 + number2
PRINT answer

END

# a method that takes an array of strings, 
# and returns a string that is all those strings 
# concatenated together

START

SET [string1, string2, string3]
combined_string = string1 + string2 + string3
READ combined_string

END

# a method that takes an array of integers, 
# and returns a new array with every other 
# element

START

GET [int1, int2, int3]
integer_array = [int1, int2, int3]
SET combined_array = [string1, array1, object1]
combined_array.push(integer_array)
READ combined_array

END