require "./00_tree_node.rb"
require 'byebug'

class KnightPathFinder
    OFFSETS = [[-2, 1], [-2, -1], [-1, 2], [2, 1],
               [2, -1], [1, 2], [-1, -2], [1, -2] ]

  def initialize(start_pos)
    @visited_positions = [start_pos]
    @move_tree = self.build_move_tree(start_pos)
  end

  def self.valid_moves(pos)
    valid_jumps = [ ]
    x , y = pos
    OFFSETS.each do |offset|
      new_x, new_y =  x + offset[0], y + offset[1]
      valid_jumps << [new_x, new_y] if KnightPathFinder.in_bounds?(new_x , new_y)
    end

    valid_jumps
  end

  def self.in_bounds?(pos_x , pos_y)
    (0..7).include?(pos_x) && (0..7).include?(pos_y)
  end


  def build_move_tree(pos)
    root = PolyTreeNode.new(pos)
    queue = [ root ]
    until queue.empty?
      parent = queue.shift
      possible_moves = new_move_positions(parent.value)

      possible_moves.each do |move|
        child = PolyTreeNode.new(move)
        child.parent = parent
        queue << child
      end
    end
    root
  end

  def new_move_positions(pos)
    possible_moves = KnightPathFinder.valid_moves(pos) - @visited_positions
    possible_moves.each { |move| @visited_positions << move }

    possible_moves
  end

  def find_path(pos)
    found_node = @move_tree.bfs(pos)
    found_node.trace_path_back
  end

end

if __FILE__ == $PROGRAM_NAME
  knight = KnightPathFinder.new([0,0])
  p knight.find_path([0,1])
end
