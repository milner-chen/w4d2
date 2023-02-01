require_relative 'board'
require_relative 'pieces/null'

module Slideable

    ORTHOGONAL_DIRS = [
        [-1, 0],    #up
        [1, 0],     #down
        [0, -1],    #left
        [0, 1]      #right
    ].freeze
    DIAGONAL_DIRS = [
        [-1, -1],   #up-left
        [-1, 1],    #up-right
        [1, -1],    #down-left
        [1, 1]      #down-right
    ].freeze

    def orthogonal_dirs
        ORTHOGONAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        possible_moves = []
        move_dirs.each do |dir|
            possible_moves += grow_unblocked_moves_in_dir(dir)
        end
        possible_moves
    end

    private
    def move_dirs
        raise "NotImplementedError"
    end

    def grow_unblocked_moves_in_dir(dir)
        moves_in_dir = []
        @pos
        step = [pos[0] + dir[0], pos[1] + dir[1]]
        while valid?(step, dir)
            moves << step
            step = [step[0] + dir[0], step[1] + dir[1]]
        end
        moves_in_dir
    end

    # helper to validate moves
        # out of bounds
        # obstacles
    def valid?(step, dir)
        return false if step[0] > 7 || step[0] < 0 || step[1] > 7 || step[1] < 0
        unless @board[step] == NullPiece.instance
            return false if @color == @board[step].color
            return false if @board[step[0] - dir[0], step[1] - dir[1]].color != @color
        end
        true 

    end

end

module Steppable
end


class Piece
    attr_reader :color
    
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        symbol
    end

    def empty?
        self.is_a?(NullPiece)
    end
    
    def valid_moves
    end

end