def file_shuffler(file_name)
  file_text = File.readlines(file_name)
  file_text = file_text.shuffle

  new_file_name = "#{file_name.split('.')[0]}_shuffle.txt"

  File.open(new_file_name, 'w') do |f|
    f.puts (file_text)
  end
end

file_shuffler("rps.rb")
