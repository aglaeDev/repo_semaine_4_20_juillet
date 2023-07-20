require "pry"
require_relative 'lib/game/game.rb'
require_relative 'lib/player/player.rb'

puts "Deux joueurs s'affrontent. Ils doivent remplir chacun à leur tour une case de la grille avec le symbole qui leur est attribué : O ou X. Le gagnant est celui qui arrive à aligner trois symboles identiques, horizontalement, verticalement ou en diagonale. 
Il est coutume de laisser le joueur jouant X effectuer le premier coup de la partie."

class Show

    def show_board(board)
        puts "\n"
        puts " 1 | 2 | 3"
        puts "---+---+---"
        puts " 4 | 5 | 6"
        puts "---+---+---"
        puts " 7 | 8 | 9 "
        puts "\n"
    end
  
end

class Game
    #TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.
  
    def initialize
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
    end
  
    def turn
        @board.display_board
        @board.play_turn(@current_player)
    
        if @board.victory?
          @board.display_board
          puts "#{@current_player.name} a gagné ! Félicitations !"
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
  
    def game_end
      @board = Board.new
        @current_player = @player1
        play
    end   

    def play
        turn until @board.victory?
        puts "Partie terminée ! Voulez-vous rejouer ? (Oui/Non)"
        response = gets.chomp.downcase

        if response == "oui"
        new_round
        else
        puts "Merci d'avoir joué ! À bientôt !"
        end 
    end
end

Game.new.play