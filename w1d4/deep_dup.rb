def deep_dup(array)
  output = []
  array.each do |el|
    output << el unless el.class == Array
    output << deep_dup(el) if el.class == Array
  end

  output
end

a = ([1, [2], [3, [4]]])
p b = deep_dup(a)
c = a.dup

p "Object id comparison"
p a[1].object_id != b[1].object_id
