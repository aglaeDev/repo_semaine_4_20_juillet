class Player
    #TO DO : la classe a 2 attr_reader, son nom et sa valeur (X ou O).
    attr_reader :name, :O, :X
   def initialize(name, O, X)
      #TO DO : doit régler son nom et sa valeur
      @name = name
      @O = O
      @X = X
    end
end