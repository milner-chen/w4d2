require "colorize"
require_relative "../piece"

class Pawn < Piece
    include Stepable

    def symbol
        "♟︎".colorize(color)
    end

    protected

    def move_diffs
    end

end