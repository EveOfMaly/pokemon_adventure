# require_relative "project_pokemon/version"



class ProjectPokemon::CLI 
    def self.call
        puts "Welcome to PokemonWorld CLI".colorize(:green)
        puts "Do you have an account 'Y' or 'N'".colorize(:blue)
        
        player_data =  Player.load_or_create_account  #creates a new user or finds an existing user data
        
        game_data = player_data.game #return the game data from the player
        
        Pokemon.create_table #create the pokemon database into our database
        PokemonAPI.create_world 
 
        game_data.choose_game #starts the game method to display game options and get input -> main game.
  
        
        #until user chooses to exit play the game 
        until game.exit?    
          game.choose_game
        end
        
    end
end