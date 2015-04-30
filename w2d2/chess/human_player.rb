class HumanPlayer
  attr_reader :name

  def initialize(name = "Player 1")
    @name = name
  end

  def provide_input
    puts "#{@name}'s turn."
    puts "Start position"
    start_pos = gets.chomp
    puts "End position"
    end_pos   = gets.chomp

    return [start_pos, end_pos]
  end
end
