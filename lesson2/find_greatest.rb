def find_greatest(numbers)
  saved_number = nil
  
  numbers.each do |num|
    saved_number ||= num
    if saved_number >= num
      next
    else
      saved_number = num
    end
  end
  
  p saved_number
  
end


x = [1,4,2,8,2]

find_greatest([1,4,2,8,2])