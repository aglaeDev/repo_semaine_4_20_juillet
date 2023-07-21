require "pry"

class BoardCase
    attr_accessor :case, :id
    
    def initialize(lacase, leid)
        @case = lacase
        @id = leid
    end
end