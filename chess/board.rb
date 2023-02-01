require_relative 'piece'
require_relative 'pieces/king'
require_relative 'pieces/queen'
require_relative 'pieces/rook'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'pieces/pawn'

class Board

    def initialize
        @grid = Array.new(8) { Array.new(8) }
        [0, 1].each do |i|
            @grid[i].each_index do |j|
                @grid[i][j] = King.new(:black, self, [i, j])
            end
        end
        (2..5).each do |i|
            @grid[i].each_index do |j|
                @grid[i][j] = NullPiece.instance
            end
        end
        [6, 7].each do |i|
            @grid[i].each_index do |j|
                @grid[i][j] = Queen.new(:white, self, [i, j])
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
        end
    end

    # private
    attr_reader :grid

    def [](pos)
        grid[pos[0]][pos[1]]
    end

    def []=(pos, value)
        grid[pos[0]][pos[1]] = value
    end

end