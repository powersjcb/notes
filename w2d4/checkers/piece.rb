require_relative 'invalid_move_error'
require 'byebug'
class Piece
  attr_reader :color, :king
  attr_accessor :position

  def initialize(options = {})
    options = { :king => false }.merge(options)
    @board    = options[:board]
    @position = options[:position]
    @color    = options[:color]
    @king     = options[:king]
  end


  def a_offset(pos, offset)
    row, col = pos
    d_row, d_col = offset

    [row + d_row, d_col + col]
  end

  def warp(pos)
    @board[pos] = self # moves self on board
    @board[@position] = nil # removes old self from board
    @position = pos # changes known position
    maybe_promote
  end

  def jumped_square(pos) # returns position jumped
    row_0, col_0 = @position
    row, col = pos
    jumped = [(row - row_0)/2 + row_0, (col - col_0)/2 + col_0]

    jumped
  end

  def maybe_promote
    far_side = (@color == :red) ? 7 : 0
    @king = true if @position[0] == far_side
  end

  def next_past(position)
    row_0, col_0 = @position
    row, col = position
    jumped = [(row - row_0) + row, (col - col_0) + col]

    jumped
  end

  def offsets
    sign = (color == :red) ? 1 : -1
    offsets = [[sign, 1], [sign, -1]]
    offsets += [[-sign, 1], [-sign, -1]] if @king == true
    offsets
  end

  def perform_jump(pos)
    if valid_jumps.include?(pos)
      @board[jumped_square(pos)] = nil # removes jumped piece
      warp(pos)

      true
    else
      puts 'invalid jump'
      raise InvalidMoveError
    end
  end

  def perform_moves(moves_seq)
    perform_moves!(moves_seq) if valid_move_sequence?(moves_seq)
  end

  def valid_move_sequence?(moves_sequence)
    test_board = @board.deep_dup
    begin
      test_piece = test_board[@position]
      test_piece.perform_moves!(moves_sequence)
    rescue InvalidMoveError

      return false
    end

    true
  end


  def perform_moves!(moves_sequence)

    if moves_sequence.one? # single move
      unless perform_slide(moves_sequence.first)  # try sliding
        unless perform_jump(moves_sequence.first) # try jumping
          raise InvalidMoveError
        end
      end
    else
      if moves_sequence.any? { |move| !perform_jump(move) }
        raise InvalidMoveError
      end
    end
  end

  def perform_slide(pos)
    if valid_slides.include?(pos)
      warp(pos)

      return true
    end

    false
  end

  def symbol
    !@king  ? "●" : "◆"
  end

  def valid_slides
    positions = []
    offsets.each do |offset|
      new_pos = a_offset(@position, offset)
      positions << new_pos if @board.on_board?(new_pos) && !@board.occupied?(new_pos)
    end

    positions
  end

  def valid_jumps
    validated_jumps = []
    offsets.each do |offset|
      jumped_pos = a_offset(@position, offset)
      if @board.on_board?(jumped_pos) && @board.occupied?(jumped_pos) &&
        !friendly?(jumped_pos) && @board[next_past(jumped_pos)].nil?

        validated_jumps << next_past(jumped_pos)
      end
    end

    validated_jumps
  end

  def friendly?(pos)
    @board[pos].color == @color
  end
end
