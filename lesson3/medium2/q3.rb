def tricky_method(a_string_param, an_array_param)
  a_string_param += " rutabaga"
  an_array_param += ["rutabaga"]
  return a_string_param , an_array_param
end

def tricky_method!(a_string_param, an_array_param)
  a_string_param << " rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method!(my_string, my_array)

"My string looks like this now: #{my_string}"
"My array looks like this now: #{my_array}"


my_string2 = "pumpkins"
my_array2 = ["pumpkins"]
tricky_method(my_string2, my_array2)

"#{my_string2}"
"#{my_array2}"



