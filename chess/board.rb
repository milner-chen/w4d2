require_relative 'piece'

class Board
    attr_reader :grid

    def initialize
        @grid = Array.new(8) { Array.new(8) }
        [0, 1, 6, 7].each do |i|
            @grid[i].each_index do |j|
                @grid[i][j] = Piece.new
            end
        end
    end

    def [](pos)
        grid[pos[0]][pos[1]]
    end

    def []=(pos, value)
        grid[pos[0]][pos[1]] = value
    end

    def move_piece(start_pos, end_pos)
        if self[start_pos] == nil
            raise "there is no piece at start pos"
        end
    end
end