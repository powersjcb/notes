!#/usr/bin/env ruby


class RPN
  attr_accessor :inputs

    def initialize
      @inputs = []
    end

    # def inputs
    #   @inputs
    # end

    def push(value)
      @inputs.push(value)
    end

    #returns top of the stack
    def value
      @inputs.last
    end

    # define operators
    # pop two, return sum
    def plus
      @inputs.push( @inputs.pop + @inputs.pop )
    end

    # pop two, return sec-first
    def minus
      first = @inputs.pop
      second = @inputs.pop
      @inputs.push( second - first )
    end

    # pop two, return quotient
    def divide
      first = @inputs.pop
      second = @inputs.pop
      @inputs.push( second.to_f / first )
    end

    # pop two, return product
    def times
      @inputs.push( @inputs.pop.to_f * @inputs.pop )
    end

    def tokens(user_input)
      convert = {"*" => :*, "+"=>:+, "-"=>:-, "/"=>:/}
      user_input.split.map! do |value|
        convert.include?(value) ? convert[value] : value.to_i
      end
    end

    def evaluate(user_input)
      tokens(user_input).each do |token|
        if [:+, :-, :*, :/].include?(token)
          validate_inputs
          execute(token)
        else
          self.push(token)
        end
      end
      return value
    end

    def execute(token)
      if token == :+
        self.plus
      elsif token == :-
        self.minus
      elsif token == :*
        self.times
      elsif token == :/
        self.divide
      end
    end


    # helper functions
    def validate_inputs
      raise "calculator is empty" unless @inputs.length > 1
    end

    def input_from_file(file)
      input = File.read(file).chomp
      puts evaluate(input)
    end

    def input_from_console
      input = gets.chomp
      puts evaluate(input)
    end

end

calc = RPN.new

p calc.tokens("1 2 3 + +")


if __FILE__ == $PROGRAM_NAME
  calc = RPN.new
  if ARGV[0]
    calc.evaluate(ARGV[0])
  else
    calc.evaluate($stdin)
  end
end
# def my_function(file = $stdin)
#   file.each do |line|
#     break if line.chomp == 'q'
#     puts line.chomp
#   end
#   puts "not running in terminal"
# end
#
# my_function
