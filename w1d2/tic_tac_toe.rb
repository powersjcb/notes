# make work using ans
#https://github.com/appacademy/TicTacToeAI/blob/master/skeleton/lib/tic_tac_toe.rb


class TicTacToe
  class Board
    attr_reader :grid, :n

    def initialize(n = 3)
      @n = n    # board size
      @grid = Array.new(n) {Array.new(n)}
    end

    def [](row,col)
      @grid[row][col]
    end

    def []=(row,col,mark)
      @grid[row][col] = mark
    end

    def self.won?
      diagonal_left
      diagonal_right
      vertical_win
      horizontal_win
    end

    def diagonal_left  #  \\\\  <- this way
      diag_left = (0...n).map { |i| @grid[i][i] }
      points_count(diag_left) == n ? true : false
    end

    def points_count(array)
      appeared = {}
      return 0 if array.include?(1) & array.include?(0)
      array.reject(&:blank?).count
    end

    def diagonal_right # //// <- this way
      (0...n).map {|i| @grid[n-1-i][i]}
      points_count(diag_right) == n ? true : false
    end

    def vertical
      (0...@grid[0].length).map {}
    end

    def horizonatal
    end




    def winner
    end

    def empty?(pos)
    end
  end

  class Player
  end

  class HumanPlayer
  end

  class ComputerPlayer
    #winning move if available, else random
  end

  class Game
    # def intitialize(HumanPlayer, ComputerPlayer)
    # end
  end
end
