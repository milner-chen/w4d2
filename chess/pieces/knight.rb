require "colorize"
require_relative "../piece"

class Knight < Piece
    include Steppable

    def symbol
        "♞".colorize(color)
    end

    protected

    def move_diffs
    end

end