require 'byebug'

class PolyTreeNode

  attr_accessor :parent, :children, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end 

  def parent=(ele)
      @parent.children.delete(self) unless parent.nil?
      @parent = ele
      @parent.children << self unless parent.nil?
  end

  def add_child(child_node)
    # debugger
    child_node.parent = self
  end

  def remove_child(child_node)
   if self.children.include?(child_node)
    child_node.parent = nil
    self.children.delete(child_node)
   else  
    raise "error" 
   end 
  end

  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |child|
      results = child.dfs(target_value)
      # next if results.nil?
      return results unless results.nil?
    end
    nil
  end

  def bfs(target_value)
    array = [self]
    until array.nil?
      tree = array.pop
      # debugger
      array.unshift(tree.children) if !tree.children.nil?
      return tree if tree.value == target_value
    end
    nil
  
  end
end