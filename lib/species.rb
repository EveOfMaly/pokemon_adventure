require_relative '../config/environment'
require_relative '../lib/pokemon'
require_relative '../lib/player'
require_relative '../lib/move'
require_relative '../lib/account_creation'
require_relative '../lib/api'

class PokemonSpecies

    attr_accessor :pokemon, :description, :base_happiness, :capture_rate, :moves, :pokedex_number

    @@all = []

    def initialize(species_data)
        @pokemon = species_data["name"]
        @description = species_data["flavor_text_entries"][1]["flavor_text"]
        @base_happiness = species_data["base_happiness"]
        @capture_rate = species_data["capture_rate"]
 
        @moves = []
        @pokedex_number = species_data["id"]
        self.class.all << self 
    end

    def link_species_data_to_pokemon(pokemon_list)
         Pokemon.all.select do |pokemon|
            if pokemon.pokedex_number == self.pokedex_number
                pokemon.species  = self
            end
        end
    end

    def self.all
        @@all 
    end

end