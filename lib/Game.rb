require "pry"

class Game
    def initialize
        puts "Joueur 1, entrez votre nom :"
        name1 = gets.chomp
        @player1 = Player.new(name1, "X")
        
        puts "Joueur 2, entrez votre nom :"
        name2 = gets.chomp
        @player2 = Player.new(name2, "O")
        
        @board = Board.new
        @current_player = @player1
    end
    
    def turn
        @board.display_board
        @board.play_turn(@current_player)
        
        if @board.victory?
            @board.display_board
            puts "#{@current_player.name} a gagné ! Félicitations !"
        elsif @board.is_nul?
            puts "match nul "
        else
            switch_player
        end
    end
    
    def switch_player
        @current_player = (@current_player == @player1) ? @player2 : @player1
    end
    
    def new_round
        @board = Board.new
        @current_player = @player1
        play
    end
    
    def play
        turn until @board.victory? || @board.is_nul?
        puts "Partie terminée ! Voulez-vous rejouer ? (Oui/Non)"
        response = gets.chomp.downcase
        
        if response == "oui"
            new_round
        else
            puts "Merci d'avoir joué ! À bientôt !"
        end
    end
end