for i in 1..10 do Kernel.puts("The Flinstones Rock!".rjust("The Flinstones Rock!".length + i)) end

# OR more concisely

10.times do |number| puts (" " * number) + "The Flinstones Rock!"  end