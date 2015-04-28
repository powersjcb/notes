def got_problems(flag)
  raise ArgumentError.new "Don't lie, you do have problems" if flag

  nil
end



def sqrt(num)
  unless num >= 0
    raise ArgumentError.new "Cannot take sqrt of negative number"
  end


end

def find_sqrts
  while true
    puts 'please input a number'
    num = Integer(gets)

    begin
      sqrt(num)
    rescue ArgumentError => e
      puts 'Not a perfect square!'
      puts "Error was #{e.message}"
    end
  end
end
