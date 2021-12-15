require_relative "project_pokemon/version"



class ProjectPokemon::CLI 
    def self.call
        puts "Welcome to PokemonWorld CLI".colorize(:green)
        puts "Do you have an account 'Y' or 'N'".colorize(:blue)
        
        #get input from user 
        
        ##account creation 
        Accounts.user #creates a new user or finds an existing user data
        player = Accounts.player_data #retrieves thae player data 
        game = Accounts.open_account(player)
        # #initialize the game and associate the particular game with the player
        
        # # game = Game.new(player)
 
        # player.game = game #associate the game with the player 
   
        #create the world
        # game.create_the_world
        PokemonAPI.create_world 
        #start the new game unti the player chooses exit

        game.choose_game
        
        
        
        #until user chooses to exit play the game 
        until game.exit? 
          game.choose_game
        end
        
    end
end