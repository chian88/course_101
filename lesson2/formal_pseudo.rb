START

SET large_number = []
SET keep_going = true

WHILE keep_going == true
  GET "enter a collection"
  SET collection
  SET largest_number = SUBPROCESS "extract the largest one from the collection"
  large_number.push(largest_number)
  GET "enter another collection"
  IF "yes"
    keep_going = true
  ELSE
    keep_going = false
  IF keep_going == false  # is this necessary ?
    exit the loop
    
  
  PRINT large_number
  
  END
    
    