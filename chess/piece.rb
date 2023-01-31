require_relative 'board'

module Slideable
    ORTHOGONAL_DIRS = []
    DIAGONAL_DIRS = []
    def moves
    end
end

module Stepable
end

class Piece

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
    end

    def empty?
    end
    
    def valid_moves
    end

end