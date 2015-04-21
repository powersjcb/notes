def caesar_cipher(string, offset)
  string.gsub(/[a-z]/) do |c|
    ((c.ord - "a".ord + offset) % 26 + "a".ord).chr
  end
end

p caesar_cipher("zany", 2) == "bcpa"
p caesar_cipher("hello", 3) == "khoor"
