def range(start, last)
  raise "Start > Last!" if start > last
  return [last] if start == last

  [start] + range(start + 1, last)
end
