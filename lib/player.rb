require_relative '../config/environment'
require_relative '../lib/pokemon'
require_relative '../lib/player'
require_relative '../lib/move'
require_relative '../lib/account_creation'

class Player 
    attr_accessor :game, :player_id, :user_name, :first_name, :last_name, :trainer_level, :pokeballs, :pokemons, :items, :pokedollars

    @@all = [] #keeps track of all players 
    
    def initialize
        @pokedollars = 3000 #each player gets 3000 pokedollars
        @player_id = nil
        @pokeballs = 10
        @user_name = nil 
        @trainer_level = 0 
        @pokemons = [] #A player has many pokemon and pokemon belong to a player 
        @items = [] #many items
        self.class.all << self 
    end

    #list of all the players
    def self.all
        @@all 
    end

    def self.find_or_create_player(user_name)
 
        if Player.all.count == 0 
            puts ".".colorize(:green)
            puts "..".colorize(:green)
            puts "...".colorize(:green)
            puts "Error. There are curently accounts in our database".colorize(:red)
            puts "Creating the acccount with that username for you:".colorize(:green)
            
            
            player = Player.new

            game = Game.new(player)
            player.game = game 
   
            player.user_name = user_name
            player 
        elsif Player.all.count > 0 
            Player.all.each do |ele|
                if ele.user_name == user_name 
                    puts "Found the player".colorize(:green)
                    puts "Opening the game associated with that player...".colorize(:green)
                    player =  ele
                    player
                else 
                    puts "User doesn't exit".colorize(:red)
                    puts "Creating the username for you:".colorize(:green)
                    player = Player.new
                    Accounts.add_account(player)
                    player.user_name = user_name
                    player 
                end
            end
        end
        player 
    end

    #when a pokemon is captured add the pokemon to list of pokemon of trainer
    def add_pokemon(pokemon)
        @pokemons << pokemon
        pokemon.player = self 
    end

    #see a list of pokemon that belong that trainer
    def pokemon_slots 

        if @pokemons.count == 0 
            puts "#{self.user_name} currently has no pokemon".colorize(:green)
            self.game.choose_game
        else
            @pokemons.map do |pokemon| 
                # puts "pokemon.nickname is a #{pokemon.name}"
                puts "Nickname: #{pokemon.nick_name}".colorize(:green)
                puts "Type of pokemon: #{pokemon.name}".colorize(:green)
                puts "Level: #{pokemon.level}".colorize(:green)
                puts "Description: #{pokemon.species.description.split("\n").join(" ").split("\f").join(" ")}".colorize(:green)
                
                puts "---------"
            end
            self.game.choose_game
        end
   
    end
end 






