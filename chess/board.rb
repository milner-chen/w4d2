require_relative 'piece'
require_relative 'pieces/king'
require_relative 'pieces/queen'
require_relative 'pieces/rook'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'pieces/pawn'

class Board

    def initialize
        @grid = Array.new(8) { Array.new(8, NullPiece.instance) }

        @grid[1].each_index do |i|
            @grid[1][i] = Pawn.new(:black, self, [1, i])
        end

        @grid[0][0] = Rook.new(:black, self, [0, 0])
        @grid[0][1] = Knight.new(:black, self, [0, 1])
        @grid[0][2] = Bishop.new(:black, self, [0, 2])
        @grid[0][3] = Queen.new(:black, self, [0, 3])
        @grid[0][4] = King.new(:black, self, [0, 4])
        @grid[0][5] = Bishop.new(:black, self, [0, 5])
        @grid[0][6] = Knight.new(:black, self, [0, 6])
        @grid[0][7] = Rook.new(:white, self, [0, 7])
        
        @grid[6].each_index do |i|
            @grid[6][i] = Pawn.new(:white, self, [6, i])
        end

        @grid[7][0] = Rook.new(:white, self, [7, 0])
        @grid[7][1] = Knight.new(:white, self, [7, 1])
        @grid[7][2] = Bishop.new(:white, self, [7, 2])
        @grid[7][3] = Queen.new(:white, self, [7, 3])
        @grid[7][4] = King.new(:white, self, [7, 4])
        @grid[7][5] = Bishop.new(:white, self, [7, 5])
        @grid[7][6] = Knight.new(:white, self, [7, 6])
        @grid[7][7] = Rook.new(:white, self, [7, 7])
    end

    def move_piece(start_pos, end_pos)
        if self[start_pos] == nil
            raise "there is no piece at #{start_pos}"
        elsif end_pos[0] < 0 || end_pos[0] > 7 || end_pos[1] < 0 || end_pos[1] > 7
            raise "the piece cannot move to #{end_pos}"
        else
            self[end_pos] = self[start_pos]
            self[start_pos] = nil
        end
    end

    attr_reader :grid

    def [](pos)
        grid[pos[0]][pos[1]]
    end

    def []=(pos, value)
        grid[pos[0]][pos[1]] = value
    end

end