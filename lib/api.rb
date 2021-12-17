# require_relative '../config/environment'
# require_relative '../lib/pokemon'
# require_relative '../lib/player'
# require_relative '../lib/move'
# require_relative '../lib/account_creation'
# require_relative '../lib/species'





class PokemonAPI 

    # get data (includes species, sprites, and base stats) about each of the first 151 pokemon
    def self.fetch_pokemon
        #Parse data using Net::HTTP
        uri = URI.parse("https://pokeapi.co/api/v2/pokemon?limit=151")
        response_pokemon = Net::HTTP.get_response(uri) #use NET::HTTP library to send an HTTP request for our program.
        response_pokemon.body 
        json_data = JSON.parse(response_pokemon.body)

         #using HTTP Party 
        # url = "https://pokeapi.co/api/v2/pokemon?limit=151"
        # response = HTTParty.get(url)
    end

    #create pokemon objects using fetched data.
    def self.create_pokemon(pokemon_results)
        pokemon_hash = {}

        results = pokemon_results["results"]

        results.each do |pokemon_hash|
            uri = URI.parse(pokemon_hash["url"])
            response_desc = Net::HTTP.get_response(uri) #use NET::HTTP library to send an HTTP request for our program.
            response_desc.body 
            json_data = JSON.parse(response_desc.body)
            new_pokemon = Pokemon.new(json_data)
        end
    end

    #get species data out of the  pokemon
    def self.fetch_pokemon_species_data
        #Parse data using using Net::HTTP
        uri = URI.parse("https://pokeapi.co/api/v2/pokemon-species?limit=3")
        response_desc = Net::HTTP.get_response(uri) #use NET::HTTP library to send an HTTP request for our program.
        response_desc.body 
        json_data = JSON.parse(response_desc.body)
    end
     
    #create pokemon species objects out of the data. 
    def self.create_species_data(pokemon_species_results)
        results = pokemon_species_results["results"]

        results.each do |species_hash|
            uri = URI.parse(species_hash["url"])
            response_desc = Net::HTTP.get_response(uri) #use NET::HTTP library to send an HTTP request for our program.
            response_desc.body 
            json_data = JSON.parse(response_desc.body)
            new_species = PokemonSpecies.new(json_data)
        
            new_species.link_species_data_to_pokemon(Pokemon.all) #uses the array of pokemon and iterates through each list. if the pokedex numbers are the self the pokemon species gets related to pokemon. 
            new_species
        end
    end



    def self.fetch_pokemon_move_data
        uri = URI.parse("https://pokeapi.co/api/v2/move?limit=3")
        response_desc = Net::HTTP.get_response(uri) #use NET::HTTP library to send an HTTP request for our program.
        response_desc.body 
        json_data = JSON.parse(response_desc.body)
    end
 

    def self.create_moves_from_species(pokemon_species_results)
        results = pokemon_species_results["results"]

        results.each do |move_hash|
            
            uri = URI.parse(move_hash["url"])
            response_desc = Net::HTTP.get_response(uri) #use NET::HTTP library to send an HTTP request for our program.
            response_desc.body 
            json_data = JSON.parse(response_desc.body)
            new_move = PokemonMove.new(json_data)
            new_move.link_moves_data_to_pokemon(Pokemon.all) #links to move object with the pokemon object that have same name.
        end
    end

    #API methods that fetch and create Pokemon, Species, and Move data. 
    def self.create_world
        PokemonAPI.fetch_pokemon
        PokemonAPI.create_pokemon(PokemonAPI.fetch_pokemon)

        PokemonAPI.fetch_pokemon_species_data
        PokemonAPI.create_species_data(PokemonAPI.fetch_pokemon_species_data)

        PokemonAPI.fetch_pokemon_move_data
        PokemonAPI.create_moves_from_species(PokemonAPI.fetch_pokemon_move_data)
    end

end




