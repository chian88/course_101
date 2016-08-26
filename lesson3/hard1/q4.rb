def generate_UUID
  character = []
  (0..9).each {  |digit| character << digit.to_s()  }
  ('a'..'f').each { |char| character << char }
  
  uuid = ''
  
  sections = [8,4,4,4,12]
  sections.each_with_index do |section , index|
    section.times { uuid += character.sample() }
    uuid += '-' unless index >= sections.size() - 1
  end
  uuid
end


p generate_UUID