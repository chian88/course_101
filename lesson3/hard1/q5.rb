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

