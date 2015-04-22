require 'byebug'
class Game
  attr_accessor :current_guess, :secret_code
  attr_reader :guesses

  def initialize(player1, player2 = ComputerPlayer.new) # player 1 is guesser
    @guesses = []
    @secret_code = []
    @current_guess
    @player1 = player1
    @player2 = player2
  end

  def play
    game_start_prompt
    @secret_code = @player2.get_code
    until over?
      display
      user_interaction
    end
    end_game_prompt
  end

  protected

    def display
      puts "|  guess  | Exact | Near |"
      self.guesses.each do |guess|
        puts "| #{guess.code.join(' ')} |" +
        "   #{guess.exact_matches(secret_code)}   |" +
        "  #{guess.near_matches(secret_code)}  |"
      end
      puts "Guesses Remaining: #{10 - guesses.length}"
    end

    def game_start_prompt
      if @player2.class == HumanPlayer
        puts "#{@player2.name}, input your secret code:"
      end
    end

    def user_interaction
      puts "#{@player1.name}, make a guess:"
      @guesses << @player1.get_code
    end

    def over?
      return false if @guesses.empty?

      if @guesses.last.exact_matches(secret_code) == 4
        @@game_over_state = "won"
        return true
      elsif @guesses.count == 10
        @@game_over_state = "lost"
        return true
      end
      false
    end

    def end_game_prompt
      puts "You #{@@game_over_state}!"
      puts "The secret code was: #{secret_code.code}"
    end
end


class Code
  attr_accessor :code

  def initialize(code)
    @code = code
  end

  def exact_matches(other_code)
    count = 0
    code.each_index do |index|
      count += 1 if self.code[index] == other_code.code[index]
    end

    count
  end

  def near_matches(other_code)
    near_matches_count = 0
    other_code.code.uniq.each do |color|
      secret_color_count = other_code.code.count(color)
      guess_color_count = code.count(color)

      if secret_color_count != 0 && guess_color_count != 0
        near_matches_count += [secret_color_count, guess_color_count].min
      end
    end
    near_matches_count -= self.exact_matches(other_code)
  end

  def self.random
    random_code = []
    4.times do
      random_code << [:R, :G, :B, :Y, :O, :P].sample
    end
    Code.new(random_code)
  end

  def self.parse_input(input)
    Code.new( input.split('').map(&:to_sym) )
  end
end

class HumanPlayer
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def get_code
    Code.parse_input(gets.chomp)
  end
end

class ComputerPlayer
  attr_accessor :name

  def initialize
    @name = "Computer"
  end

  def get_code
    Code.random
  end
end


jacob = HumanPlayer.new("Jacob")
austin = HumanPlayer.new("Austin")
game = Game.new(jacob, austin)
game.play
