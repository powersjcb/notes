# require 'byebug'
# debugger
class GuessNumber
  attr_accessor :guesses, :guess
  attr_reader :answer

  def initialize
    @answer = rand(1..2)
    @guesses = 0
    @guess = nil
  end

  def play
    until guess == answer
      puts "Guess a number!"
      self.guess = gets.to_i

      if guess > answer
        puts "Your guess is too high!"
      elsif guess < answer
        puts "Your guess is too low!"
      else
        puts "You win!"
      end
    end
  end
end

game = GuessNumber.new

game.play


self.some_variable = 2
