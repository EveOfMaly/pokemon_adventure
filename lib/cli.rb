require_relative "project_pokemon/version"



class ProjectPokemon::CLI 
    def self.call
        puts "Welcome to PokemonWorld CLI".colorize(:green)
        puts "Do you have an account 'Y' or 'N'".colorize(:blue)
        
        player_data =  Player.load_or_create_account  #creates a new user or finds an existing user data
        
        game_data = player_data.game
       
        PokemonAPI.create_world 
    
        game_data.choose_game
  
        
        #until user chooses to exit play the game 
        until game.exit? 
          game.choose_game
        end
        
    end
end