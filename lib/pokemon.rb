require_relative '../config/environment'
require_relative '../lib/pokemon'
require_relative '../lib/player'
require_relative '../lib/move'
require_relative '../lib/account_creation'

class Pokemon
    #pokemon belong to a player
    attr_accessor :player, :name, :pokedex_number, :level, :base_experience, :description, :moves, :base_happiness, :capture_rate,  :nick_name, :species

    @@pokedex = []  #responsible for keeping track of all pokemon in this world

    def initialize(pokemon_data)
        @name = pokemon_data["name"]
        @base_experience = pokemon_data["base_experience"] 
        @pokedex_number = pokemon_data["id"]
        @moves = []  #pokemon has many moves
       
        self.class.all << self  #every encounter with a pokemon we put in the pokedex.       
       
    end


    def self.all 
        @@pokedex 
    end

 

#    @@pm_array = []
#    @@desc_array = []
#    @@move_array = []

   #question: how do i get the data sof if we search a large set it doesn't take forever....?

    # def self.get_pokemon
    #     for i in 1..3
    #         # get data (including species, sprites, and base stats) about each of the first 151 pokemon
    #         uri = URI.parse("https://pokeapi.co/api/v2/pokemon/#{i}")
    #         response_pokemon = Net::HTTP.get_response(uri) #use NET::HTTP library to send an HTTP request for our program.
    #         response_pokemon.body 
    #         json_data = JSON.parse(response_pokemon.body)
    #         @@pm_array.push(json_data)

    #         # #get description data of the pokemon: 
    #         uri = URI.parse("https://pokeapi.co/api/v2/pokemon-species/#{i}")
    #         response_desc = Net::HTTP.get_response(uri) #use NET::HTTP library to send an HTTP request for our program.
    #         response_desc.body 
    #         json_data = JSON.parse(response_desc.body)
    #         @@desc_array.push(json_data)
    #     end
    # end

    # def self.create_pokemon
    #     Pokemon.get_pokemon
     
    #     for pokemon in @@pm_array
    #         new_pokemon = Pokemon.new
    #         new_pokemon.pokedex_number  = @@desc_array[pokemon["id"]-1]["pokedex_numbers"][0]["entry_number"]
    #         new_pokemon.name = pokemon["name"]
    #         new_pokemon.base_experience = pokemon["base_experience"]
    #         new_pokemon.description = @@desc_array[pokemon["id"]-1]["flavor_text_entries"][0]["flavor_text"]
    #         new_pokemon.base_happiness = @@desc_array[pokemon["id"]-1]["base_happiness"]
    #         new_pokemon.capture_rate = @@desc_array[pokemon["id"]-1]["capture_rate"]
            
    #         #great the Move objects for each move adn 
    #         @@new_pokemon_moves_collection = pokemon["moves"] 
    #         new_pokemon.create_move
    #         new_pokemon.moves = @@new_move
    #         new_pokemon
    #     end
    # end



    ##array of moves for pokemon all 

    ## go through list of pokemon and create an instance for each move
    ##associated each move with pokemon 

    #add_instances of moves for specific pokemon and associate moves
   
    # def create_move
    #      @@new_pokemon_moves_collection 
         
    #      array_of_moves_data = []
         
    #      @@new_pokemon_moves_collection.each do |move|
    #         array_of_moves_data <<  move
    #     end

    #     @@new_move = []

    #     array_of_moves_data

    #     array_of_moves_data.each do |move_hash|
    #         move_name = move_hash["move"]["name"]
    #         move_level_learned = move_hash["version_group_details"][0]["level_learned_at"]
    #         new_move = Move.new #create the individual move 
    #         new_move.name = move_name 
    #         new_move.move_level_learned 
    #         new_move.pokemon = self  #associate the move instances with the particular pokemon
    #     end
    # end

    # def self.list_pokemon_moves(pokemon)
    #     #find pokemon name
    #     kkk = []
    #     answer = Move.all.select {|move| move.pokemon.name == pokemon}
    #     answer.each do |move|
    #         kkk << move.name
    #     end
    #     kkk
    # end

    

end














