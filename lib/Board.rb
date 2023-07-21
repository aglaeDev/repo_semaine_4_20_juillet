require "pry"

class Board
    attr_accessor :array_cases
    
    def initialize
        
        @A1 = BoardCase.new(" ", 1)
        @A2 = BoardCase.new(" ", 2)
        @A3 = BoardCase.new(" ", 3)
        @B1 = BoardCase.new(" ", 4)
        @B2 = BoardCase.new(" ", 5)
        @B3 = BoardCase.new(" ", 6)
        @C1 = BoardCase.new(" ", 7)
        @C2 = BoardCase.new(" ", 8)
        @C3 = BoardCase.new(" ", 9)
        
        
        @array_cases = [@A1, @A2, @A3, @B1, @B2, @B3, @C1, @C2, @C3]
    end
    
    def play_turn(player)
        puts "#{player.name}, c'est à vous de jouer. Choisissez un numéro de case (1 à 9) la première colonne correspond à 1 et la dernière à 9 : "
        selected_case = gets.chomp.to_i
        
        board_case = array_cases.find { |case_obj| case_obj.id == selected_case }
        
        if board_case
            if board_case.case == " "
                board_case.case = player.symbol
            else 
                puts "Case déjà sélectionnée. Veuillez choisir une autre case."
                play_turn(player)
            end
        else
            puts "Case invalide. Veuillez choisir un numéro de case parmi 1 à 9."
            play_turn(player)
        end
        
    end
    
    def display_board
        puts "\n"
        puts " #{@A1.case} | #{@A2.case} | #{@A3.case}"
        puts "---+---+---"
        puts " #{@B1.case} | #{@B2.case} | #{@B3.case}"
        puts "---+---+---"
        puts " #{@C1.case} | #{@C2.case} | #{@C3.case}"
        puts "\n"
    end
    
    def victory?
        winning_combinations = [
        [@A1, @A2, @A3], [@B1, @B2, @B3], [@C1, @C2, @C3],
        [@A1, @B1, @C1], [@A2, @B2, @C2], [@A3, @B3, @C3], 
        [@A1, @B2, @C3], [@A3, @B2, @C1]
    ]
    
    winning_combinations.each do |combination|
        if combination.all? { |case_obj| case_obj.case == "X" } ||
        combination.all? { |case_obj| case_obj.case == "O" }
        return true
    end
end
false
end

def is_nul? #Convention
    array_cases_nul = [@A1.case, @A2.case, @A3.case, @B1.case, @B2.case, @B3.case, @C1.case, @C2.case, @C3.case]
    if array_cases_nul.include?(" ")
        return false
    else 
        return true 
    end
end
end
