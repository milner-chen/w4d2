require 'singleton'
require_relative "../piece"

class NullPiece
    include Singleton

    def initialize
        @color = nil
        @symbol = ' '

    def color
        @color
    end

    def symbol
        @symbol
    end

end