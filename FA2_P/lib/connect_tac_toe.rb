require_relative 'board'
require_relative 'player'

class ConnectTacToe


    # This ConnectTacToe#play method is given for free and does not need to be modified
    # It is used to make your game playable.
    def play
        until @board.winner?(@player_1.token) || @board.winner?(@player_2.token)
            @board.print
            self.play_turn
            p "--------------------"
        end

        self.switch_players!
        @board.print
        p @current_player.token + " has won!"
    end

    def initialize(numstacks, maxheight)
        @board = Board.new(numstacks, maxheight)
        @player_1 = Player.new('y')
        @player_2 = Player.new('b')
        @current_player = @player_1
    end

    def switch_players!
        @current_player = @current_player == @player_1 ? @player_2  : @player_1
    end

    def play_turn
        stacki = @current_player.get_stack_index
        @board.add(@current_player.token, stacki)
        self.switch_players!
    end
end
