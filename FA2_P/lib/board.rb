class Board

    attr_reader :max_height
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

    def self.build_stacks(numstacks)
        Array.new(numstacks) {Array.new(0)}
    end

    def initialize(numstacks, maxheight)
        unless (numstacks >= 4 && maxheight >= 4)
            raise ArgumentError.new("rows and cols must be >= 4")
        end
        @max_height = maxheight
        @stacks = Board.build_stacks(numstacks)
    end

    def add(token, stacki)
        if @stacks[stacki].size < @max_height
            @stacks[stacki] << token
            true
        else
            false
        end
    end

    def vertical_winner?(token)
        @stacks.any?{|stack| stack.all?{|tk| tk == token} && stack.size == @max_height}

    end

    def horizontal_winner?(token)
        (0...@max_height).any? {|h| @stacks.all? {|stack| stack[h] == token}}
    end

    def winner?(token)
        self.vertical_winner?(token) || self.horizontal_winner?(token)
    end

end
