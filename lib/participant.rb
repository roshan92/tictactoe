class Participant

  attr_reader :name

  def initialize(name) @name = name; end

  def get_move(game, mark)
    puts "#{@name}, State your move: "
    pos = gets.chomp.split(',').map(&:to_i)
    until valid_move? pos
      puts "Fault move, enter any 2 numbers in the range of 0 and 2, separated by a comma. e.g: 1,0"
      pos = gets.chomp.split(',').map(&:to_i)
    end
    pos
  end


  private

  def valid_move?(pos)
    pos.all? { |coord| (0..2).include?(coord) } && pos.length == 2
  end

end
