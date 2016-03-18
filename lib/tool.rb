class Tool

  attr_reader :grid, :winner

  def self.blank_board
    Array.new(3) { Array.new(3) }
  end

  def initialize(grid = self.class.blank_board)
    @grid = grid
    @winner = false
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

 def place_mark(pos, mark)
   self[pos] = mark
 end

 def empty?(pos)
   self[pos].nil?
 end

 def won?
   check_col || check_row || check_diag
 end

 def tie?
   self.grid.each.all? { |row| row.all? }
 end

 def dup
   duped_grid = grid.map(&:dup)
   self.class.new(duped_grid)
 end


 private

 def check_diag
   diag1 = self[[0,0]], self[[1,1]], self[[2,2]]
   diag2 = self[[0,2]], self[[1,1]], self[[2,0]]
   @winner = winning_triple?(diag1) || winning_triple?(diag2)
 end

 def check_col
   3.times do |idx|
     col = []
     @grid.each do |row|
       col << row[idx]
     end
     @winner = winning_triple?(col)
     return @winner if @winner
   end
   false
 end

 def check_row
   @grid.each do |row|
     @winner = winning_triple?(row)
     return @winner if @winner
   end
   false
 end

 def winning_triple?(triple)
   return triple[0] if triple.all? { |val| val == :x } || triple.all? { |val| val == :o}
   false
 end
end
