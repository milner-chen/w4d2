require_relative 'piece'

class Board

    def initialize
        @grid = Array.new(8) { Array.new(8) }
        [0, 1, 6, 7].each do |i|
            @grid[i].each_index do |j|
                @grid[i][j] = Piece.new
            end
        end
    end

    def move_piece(start_pos, end_pos)
        if self[start_pos] == nil
            raise "there is no piece at #{start_pos}"
        elsif end_pos[0] < 0 || end_pos[0] > 7 || end_pos[1] < 0 || end_pos[1] > 7
            raise "the piece cannot move to #{end_pos}"
        else
            self[end_pos] = self[start_pos]
            self[start_pos] = nil
            # grid[end_pos[0]][end_pos[1]] = grid[start_pos[0]][start_pos[1]]
            # grid[start_pos[0]][start_pos[1]] = nil
        end
    end

    private
    attr_reader :grid

    def [](pos)
        grid[pos[0]][pos[1]]
    end

    def []=(pos, value)
        grid[pos[0]][pos[1]] = value
    end

end