require "colorize"
require_relative "../piece"

class King < Piece
    include Stepable

    def symbol
        "♚".colorize(color)
    end

    protected

    def move_diffs
    end

end