require 'json'
require_relative 'tableau'

class FreeCell

  def initialize
    @tableau = Tableau.new
    @moves = 0
    @game_over = false
  end


  def play
    until @tableau.won? || @game_over
      @tableau.render_all
      puts "Moves: #{@moves}"
      get_user_input
      @moves += 1
    end

    puts "Thanks for playing"
    puts "You win!" if @tableau.won?


  end

  def get_user_input
    begin
      user_input = gets.chomp
      if user_input == "quit"
        @game_over = true
        return
      end

      attempted_move = JSON.parse(user_input)
      card_position, new_pile = attempted_move

      #overide for card_position if pulling from foundations
      if card_position[0] > 7
        temp_depth = @tableau.piles[card_position[0]].count - 1
        card_position = [card_position[0], temp_depth]
      end

      @tableau.move(card_position, new_pile)

    rescue JSON::ParserError, InvalidMoveError => e
      puts e
      retry
    end
  end
end


FreeCell.new.play
