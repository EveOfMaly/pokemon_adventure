require_relative '../config/environment'
require_relative '../lib/pokemon'
require_relative '../lib/player'

class PokemonMove
    attr_accessor :move, :pokemon, :name, :accuracy, :level_learned, :learned_by_pokemon
    
    @@all = [] 

    def initialize(species_data)
        @accuracy = species_data["accuracy"]
        @name = species_data["name"]
        @pokemon = []
        @level_learned = "add"
        @learned_by_pokemon = species_data["learned_by_pokemon"]
        self.class.all << self 
        
    end

    
    def self.all
        @@all 
    end


    def link_moves_data_to_pokemon(pokemon_list)
        Pokemon.all.each do |pokemon|
            @learned_by_pokemon.each do |move|
                if pokemon.name == move["name"]
                    pokemon.moves  <<  self.name
                end
            end
        end
    end

    #list moves associated with the pokemon instance
    
end 





