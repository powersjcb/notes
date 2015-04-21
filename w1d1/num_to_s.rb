def num_to_s(num, base)
  units = Hash[
    0, "0",
    1, "1",
    2, "2",
    3, "3",
    4, "4",
    5, "5",
    6, "6",
    7, "7",
    8, "8",
    9, "9",
   10, "A",
   11, "B",
   12, "C",
   13, "D",
   14, "E",
   15,"F"]

  i = 0
  result = ""
  while base ** i < num
    result << units[(num / (base ** i)) % base]

    i += 1
  end
  result.reverse
end


p num_to_s(5, 10) == "5"
p num_to_s(5, 2)  == "101"
p num_to_s(5, 16) == "5"

p num_to_s(234, 10) == "234"
p num_to_s(234, 2)  == "11101010"
p num_to_s(234, 16) == "EA"
