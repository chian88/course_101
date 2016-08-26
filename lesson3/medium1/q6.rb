def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element #it goes into the variable buffer
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

a = [1,2]

p rolling_buffer1(a, 2, 5)
p a


def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

b = [1,2]
p rolling_buffer2(b, 2, 5)
p b


# no difference. The paramete