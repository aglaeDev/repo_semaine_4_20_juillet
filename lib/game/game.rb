class BoardCase
    #TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case
    attr_accessor :case, :id
    
    def initialize(cases, id)
      #TO DO : doit régler sa valeur, ainsi que son numéro de case
      @case = cases
      @id = id
    end
    
end
  
class Board
    #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
    #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
    attr_accessor :array_cases
  
    def initialize
      #TO DO :
      #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
      #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
      @A1 = BoardCase.new(1, " ")
      @A2 = BoardCase.new(2, " ")
      @A3 = BoardCase.new(3, " ")
      @B1 = BoardCase.new(4, " ")
      @B2 = BoardCase.new(5, " ")
      @B3 = BoardCase.new(6, " ")
      @C1 = BoardCase.new(7, " ")
      @C2 = BoardCase.new(8, " ")
      @C3 = BoardCase.new(9, " ")
      @array_cases = [@A1, @A2, @A3, @B1, @B2, @B3, @C1, @C2, @C3]
    end
  
    def play_turn
      #TO DO : une méthode qui :
      #1) demande au bon joueur ce qu'il souhaite faire
      #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
      puts "#{player.name}, c'est à vous de jouer. Choisissez un numéro de case (1 à 9) la premiere collonne correspond à 1 et la dernier a 9 : "
      selected_case = gets.chomp.to_i

      board_case = array_cases.find { |case_obj| case_obj.id == selected_case }
      if board_case
        board_case.case = player.symbol
      else
        puts "Case invalide. Veuillez choisir un numéro de case parmi 1 à 9."
        play_turn(player)
    end
    end
  
    def victory?
      #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
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
end