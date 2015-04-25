require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @parent = nil
  end

  def losing_node?(evaluator)
    if @board.won?
      @board.winner != evaluator
    else
      false
    end
  end

  def winning_node?(evaluator)
    if @board.won?
      @board.winner == evaluator
    else
      false
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    possible_moves = [ ]
    @board.each do |row|
      @col.each do |col|
        move = [row, col]
        possible_moves << move if @board.empty?(move)
      end
    end

    children_array = possible_moves.map do |move|
      child_board = board.dup
      child_board[move] = next_mover_mark
      child = TicTacToeNode.new(child_board, @next_mover_mark, move)
      child.parent = self
      child.switch_mark
    end

    children_array
  end


  def switch_mark
    @next_mover_mark = (@next_mover_mark == :x) ? :o : :x
  end

protected

  def parent=(tictacnode)
    @parent = tictacnode
  end

end
