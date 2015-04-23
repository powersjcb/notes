#!/usr/bin/env ruby
require 'byebug'

class Hangman
  attr_reader :guesses

  def initialize(guessing_player, checking_player)
    @guessing_player = guessing_player
    @checking_player = checking_player
    @secret_word = []
    @guesses = []
  end

  def play
    begin_game_display
    get_secret_word_length
    until over?
      display_secret_word
      get_guess
      evaluate_guess
    end

    end_game_display
    puts @checking_player.secret_word
  end

  protected
    def begin_game_display
      puts "Welcome to Hangman!"
    end

    def get_secret_word_length
      length = @checking_player.get_secret_word_length
      @secret_word = Array.new(length) { nil }
    end

    def over?
      !@secret_word.include?(nil) || @guesses.length == 7
    end

    def display_secret_word
      puts "#{@secret_word.join('|')}"
    end

    def get_guess
      @guesses << @guessing_player.get_letter
    end

    def evaluate_guess
      position_array = @checking_player.evaluate_guess(@guesses.last)
      position_array.each { |pos| @secret_word[pos] = @guesses.last }
    end

    def end_game_display
      if guessing_player_won?
        puts "#{@guessing_player.name} won!"
      else
        puts "#{@checking_player.name} won!"
      end

      puts "Thanks for playing."
    end

    def guessing_player_won?
      @secret_word.none?(&:nil?)
    end

end

class HumanPlayer

  def initialize(name)
    @name = name
  end

  def get_secret_word_length
    puts "Please input secret word length"
    Integer(gets)
  end

  def get_letter
    puts "Guess a letter:"

    input = ''
    loop do
      input = gets.chomp
      break if input =~ /\A[a-z]\z/
      puts "Invalid input. Please input a lower case letter."
    end

    input
  end

  def evalute_guess(letter)
    puts "Is #{letter} in your word? (y/n)"
    if gets.chomp == 'y'
      puts "At what position(s) in you word did the letter appear?"
      puts "(Format Ex: 1, 3)"
      return gets.chomp.split(', ').map(&:to_i)
    end

    []
  end
end

class ComputerPlayer
  attr_accessor :name
  attr_accessor :secret_word

  def initialize
    @name = "Computer"
  end

  def get_secret_word_length
    dictionary = File.readlines('./dictionary.txt').map(&:chomp)
    @secret_word = dictionary.sample
    @secret_word.length
  end

  def get_letter
    ('a'..'z').to_a.sample
  end

  def evaluate_guess(letter)
    positions = []
    @secret_word.chars.each_index do |index|
      positions << index if @secret_word[index] == letter
    end

    positions
  end
end

if __FILE__ == $PROGRAM_NAME
  austin = HumanPlayer.new("Austin")
  comp = ComputerPlayer.new
  game = Hangman.new(austin, comp)
  game.play
end
