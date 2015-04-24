def eval_block(*args, &block)
  raise "NO BLOCK GIVEN!" if block.nil?

  block.call(*args)
end

eval_block("Kerry", "Washington", 23) do |fname, lname, score|
  puts "#{lname}, #{fname} won #{score} votes."
end
