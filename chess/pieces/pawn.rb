require "colorize"
require_relative "../piece"

class Pawn < Piece
    include Steppable

    def symbol
        "♟︎".colorize(color)
    end

    # protected

    def at_start_row?
        (@pos[0] == 1 && color == :black) || (@pos[0] == 6 && color == :white)
    end

    def threatening?
        if color == :white
            return board[[pos[0] - 1, pos[1] - 1]].color == :black ||
                board[[pos[0] - 1, pos[1] + 1]].color == :black 
        elsif color == :black
            return board[[pos[0] + 1, pos[1] - 1]].color == :white ||
                board[[pos[0] + 1, pos[1] + 1]].color == :white
        end 
    end

    def move_diffs

        # either
        # no piece to take -> forward only
            # piece to take -> forward 2 || diagonally (once)
            # at_start_row? true -> forward 1 or 2
        # if color == :white
        #     if at_start_row? 
        # end
        

        # return king_diff[0..2] if color == :white
        # return king_diff[5..7]
    end

end