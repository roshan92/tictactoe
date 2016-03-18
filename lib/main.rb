class Main
  
    attr_reader :tool, :turn

    def initialize(participant1, participant2)
      @participants = { x: participant1, o: participant2 }
      @tool = Tool.new
      @turn = :x
    end

    def start
      until @tool.won? || @tool.tie?
        puts @winner
        show_tool
        move = @participants[@turn].get_move(self, self.turn)
        until valid_move?(move)
          puts "Fault move, that square is already taken"
          move = @participants[@turn].get_move(self, self.turn)
        end
        self.tool.place_mark(move, @turn)
        @turn = swap_turn
      end
      if self.tool.winner
        show_tool
        puts "#{@participants[self.tool.winner].name} wins!"
      else
        show_tool
        puts "tie game!"
      end
    end

    private

    def valid_move?(pos)
      self.tool.empty?(pos)
    end

    def show_tool
      self.tool.grid.each { |row| p row }
    end

    def swap_turn
      @turn == :x ? :o : :x
    end
end
