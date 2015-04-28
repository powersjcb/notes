require 'byebug'
class PolyTreeNode
  attr_reader :value

  def initialize(value=nil)
    @value = value
    @parent = nil  # node object
    @children = [ ] # array of node objects

  end

  def parent
    @parent
  end

  def parent=(parent_node)
    @parent.children = @parent.children - [self] unless @parent.nil?

    @parent = parent_node

    unless parent_node.nil? || parent_node.children.include?(self)
      parent_node.children << self
    end
  end

  def add_child(node_obj)
    @children << node_obj
    node_obj.parent = self
  end

  def bfs(target)
    queue = [self]

    until queue.empty?
      checking_node = queue.shift
      return checking_node if target == checking_node.value
      checking_node.children.each {|child| queue.push(child) }
    end

    nil
  end

  def children
    @children
  end

  def children=(nodes)
    @children = nodes
  end

  def dfs(target)
    return self if target == self.value

    @children.each do |child|
      result = child.dfs(target)
      return result unless result.nil?
    end

    nil
  end

  def trace_path_back
    current_node = self

    path = [ ]

      # debugger #if found_node.parent == self
    until current_node.parent.nil?
      path << current_node.value
      current_node = current_node.parent
    end
    path.reverse.unshift(current_node.value)
  end

  def remove_child(node_obj)
    if @children.include?(node_obj)
      @children = @children - [node_obj]
      node_obj.parent = nil
    else
      raise "invalid child"
    end
  end

  def value
    @value
  end

end
