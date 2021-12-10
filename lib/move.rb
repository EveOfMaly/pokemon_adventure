require_relative '../config/environment'
require_relative '../lib/pokemon'
require_relative '../lib/player'

class Move
    attr_accessor :move, :pokemon, :name, :move_level_learned 
    
    @@all = [] 

    def initialize
        self.class.all << self 
    end
    
    def self.all
        @@all 
    end

    #list moves associated with the pokemon instance
    
end 



