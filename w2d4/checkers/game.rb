require_relative 'board'
require_relative 'human_player'

class Game

  def initialize
    @board = Board.new
    options1 = { name: "Jacob",    board: @board, color: :red }
    options2 = { name: "Player 2", board: @board, color: :white }
    @player1 = HumanPlayer.new(options1)
    @player2 = HumanPlayer.new(options2)
  end

  def play
    turn = 1
    until @board.pieces.any? {|piece| piece.color == @player1.color}
      player = turn.odd? ? @player1 : @player2
      player.cursor_select
      turn += 1
    end
    puts "Turn: #{turn}"
    @board.render
  end
end


if __FILE__ == $0
  Game.new.play

end
