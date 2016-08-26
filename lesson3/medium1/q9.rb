munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


munsters.each do |family, attribute|
  age_group = case attribute["age"]
  when 0..17
    'kid'
  when 18..64
    'adult'
  else
    'senior'
  end
  attribute["age_group"] = age_group
  
end

p munsters






