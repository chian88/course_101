def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id}"
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id}"
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id}"
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id}"
  
  method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)
  
  
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call.\n\n"
  
  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method.\n\n" rescue puts "ugh ohhhhh"

end



def method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)
  
  
  a_outer_inner_id = a_outer.object_id
  b_outer_inner_id = b_outer.object_id
  c_outer_inner_id = c_outer.object_id
  d_outer_inner_id = d_outer.object_id
  
  puts "a_outer id is #{a_outer_id} before the method, and is #{a_outer_inner_id} in the method."
  puts "b_outer id is #{b_outer_id} before the method, and is #{b_outer_inner_id} in the method."
  puts "c_outer id is #{c_outer_id} before the method, and is #{c_outer_inner_id} in the method."
  puts "d_outer id is #{d_outer_id} before the method, and is #{d_outer_inner_id} in the method."
  
  
  a_outer = 22
  b_outer = 'thirty three'
  c_outer = [44]
  d_outer = c_outer[0]
  
  puts "after reassignment, a_outer id is #{a_outer.object_id}"
  puts "after reassignment, b_outer id is #{b_outer.object_id}"
  puts "after reassignment, c_outer id is #{c_outer.object_id}"
  puts "after reassignment, d_outer id is #{d_outer.object_id}"
  
  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = d_outer
  
  puts "inner ID for a is #{a_inner.object_id}"
  puts "inner ID for b is #{b_inner.object_id}"
  puts "inner ID for c is #{c_inner.object_id}"
  puts "inner ID for d is #{d_inner.object_id}"
  
  
  
  
  
  
end

fun_with_ids