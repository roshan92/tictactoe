require_relative 'computer.rb'
require_relative 'node.rb'

class Unbeatable < Computer

  def initialize(name); super name; end

  def get_move(main, mark)
    node = Node.new(main.tool, mark)
    pos_moves = node.children
    node = pos_moves.find{ |child| child.winning_node?(mark) }
    return node.prev_move if node
    node = pos_moves.find{ |child| !child.losing_node?(mark) }
    return node.prev_move if node
  end

end
