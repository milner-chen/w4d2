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

    def move_dirs
        raise "NotImplementedError"
    end

    def grow_unblocked_moves_in_dir(dir)
        moves_in_dir = []
        step = [@pos[0] + dir[0], @pos[1] + dir[1]]
        while valid?(step, dir)
            moves_in_dir << step
            step = [step[0] + dir[0], step[1] + dir[1]]
        end
        moves_in_dir
    end

    def valid?(step, dirf)
        return false if step[0] > 7 || step[0] < 0 || step[1] > 7 || step[1] < 0
        unless @board[step] == NullPiece.instance
            return false if @color == @board[step].color
            return false if @board[[step[0] - dirf[0], step[1] - dirf[1]]].color != @color
        end
        true
    end

end

module Steppable

    KING_DIFF = [
        [-1, 0],    #up
        [-1, -1],   #up-left
        [-1, 1],    #up-right
        [0, -1],    #left
        [0, 1],     #right
        [1, 0],     #down
        [1, -1],    #down-left
        [1, 1]      #down-right
    ].freeze

    KNIGHT_DIFF = [
        [2, 1],
        [2, -1],
        [-2, 1],
        [-2, -1],
        [1, 2],
        [1,-2],
        [-1, 2],
        [-1, -1]
    ]
    

    def king_diff
        KING_DIFF
    end

    def knight_diff
        KNIGHT_DIFF
    end

    def valid?(step, dirf)
        return false if step[0] > 7 || step[0] < 0 || step[1] > 7 || step[1] < 0
        unless @board[step] == NullPiece.instance
            return false if @color == @board[step].color
            return false if @board[[step[0] - dirf[0], step[1] - dirf[1]]].color != @color
        end
        true
    end

    def moves
        possible_moves = []
        move_diffs.each do |diff|
            step = [@pos[0] + diff[0], @pos[1] + diff[1]]
            possible_moves << step if valid?(step, diff)
        end
        possible_moves
    end

    def move_diffs
        raise "NotImplementedError"
    end

end

class Piece
    attr_reader :color, :pos
    
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