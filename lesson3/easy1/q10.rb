flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hash = {}
flintstones.each() do |name|
      hash[name] = flintstones.index(name)
end

p hash