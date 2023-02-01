require 'singleton'
require_relative "../piece"

class NullPiece
    include Singleton

    def initialize
        @color = nil
        @symbol = ' '
    end

    def color
        @color
    end

    def symbol
        @symbol
    end

end