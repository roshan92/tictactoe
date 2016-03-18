require_relative 'main'

class Node

  attr_reader :tool, :prev_move, :next_mover

  def initialize(tool, next_mover, prev_move = nil)
    @tool, @prev_move, @next_mover =
    tool, prev_move, next_mover
  end

  def losing_node?(evaluator)
    if tool.won? || tool.tie?
      return tool.winner != evaluator && tool.won?
    end

    if self.next_mover == evaluator
      self.children.all? { |node| node.losing_node?(evaluator) }
    else
      self.children.any? { |node| node.losing_node?(evaluator) }
    end

  end

  def winning_node?(evaluator)
    if self.tool.won? || tool.tie?
      return tool.winner == evaluator
    end

    if self.next_mover == evaluator
      self.children.any? { |node| node.winning_node?(evaluator) }
    else
      self.children.all? { |node| node.winning_node?(evaluator) }
    end
  end

  def children
    children = []

    (0..2).each do |row_idx|
      (0..2).each do |col_idx|
        pos = [row_idx, col_idx]

        next unless tool.empty?(pos)

        new_tool = tool.dup
        new_tool.place_mark pos, next_mover
        next_mover = (self.next_mover == :x ? :o : :x)

        children << Node.new(new_tool, next_mover, pos)
      end
    end

    children
  end



end
