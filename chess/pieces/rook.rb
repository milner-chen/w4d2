require "colorize"
require_relative "../piece"

class Rook < Piece
    include Slideable

    def symbol
        "♜".colorize(color)
    end

    protected

    def move_dirs
        orthogonal_dirs
    end

end