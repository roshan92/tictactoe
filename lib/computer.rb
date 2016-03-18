require_relative 'participant.rb'

class Computer < Participant
  def initialize(name); super name; end

  def get_move(main, mark)
    pos_moves = possible_moves(main.tool)
    random_move(pos_moves)
  end

  def random_move(possible_moves); possible_moves.sample; end

  private

  def possible_moves(tool)
    possible = []
    tool.grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        possible << [row_idx, col_idx] if col.nil?
      end
    end
    possible
  end
end
