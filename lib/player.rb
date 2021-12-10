require_relative '../config/environment'
require_relative '../lib/pokemon'
require_relative '../lib/player'
require_relative '../lib/move'

class Player 
    attr_accessor :player_id, :user_name, :first_name, :last_name, :trainer_level, :pokeballs, :pokemons, :items

    @@all = []
    
    def initialize
        @player_id = nil
        @user_name = nil 
        @trainer_level = 0 
        @pokemons = [] #A player has many pokemon and pokemon belong to a player 
        self.class.all << self 
    end

    def self.all
        @@all 
    end

    def self.find_or_create_player(user_name)
        if Player.all.count == 0 
            puts "User doesn't exit"
            puts "Creating the username for you:"
            new_player = Player.new
            new_player.user_name = user_name
        elsif Player.all.count > 0 
            Player.all.each do |ele|
                if ele.user_name == user_name 
                    puts "player exist"
                    puts "open that player"
                else 
                    puts "User doesn't exit"
                    puts "Creating the username for you:"
                    new_player = Player.new
                    new_player.user_name = user_name
                end
            end
        end
    end

    def capture_pokemon

    end

    #when a pokemon is captured add the pokemon to list of pokemon of trainer
    def add_pokemon(pokemon)
        @pokemons << pokemon
        pokemon.player = self 
        binding.pry
    end

    #see a list of pokemon that belong that trainer
    def pokemon_slots 
        @pokemons.map do |pokemon| 
            puts "pokemon.nickname is a #{pokemon.name}"
            puts "pokemon.description"
        end
    end
end 






