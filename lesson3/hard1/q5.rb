def ip_analyzer(input)
  ip_word = input.split(".")
  if ip_word.size() == 4
    ip_word.each do |digit|
      if !is_a_number?(digit)
        return false
        break
      end
    end
    return true
  else
    return false
  end
end



# as per solution
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  
  return false unless dot_separated_words.size() == 4
  
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)
  end
  true
end
